import 'dart:async';

import 'package:eye_video/framework/uikit/carousel/carousel_controller.dart';
import 'package:eye_video/framework/uikit/carousel/carousel_option.dart';
import 'package:eye_video/framework/uikit/carousel/carousel_state.dart';
import 'package:eye_video/framework/uikit/carousel/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  final CarouselOption options;
  final List<Widget> items;
  final IndexedWidgetBuilder itemBuilder;
  final CarouselController _carouselController;
  final int itemCount;

  CarouselSlider({
    @required this.items,
    @required this.options,
    carouselController,
    Key key,
  })  : itemBuilder = null,
        itemCount = items != null ? items.length : 0,
        _carouselController = carouselController ?? CarouselController(),
        super(key: key);

  CarouselSlider.builder({
    @required this.itemCount,
    @required this.itemBuilder,
    @required this.options,
    carouselController,
    Key key,
  })  : items = null,
        _carouselController = carouselController ?? CarouselController(),
        super(key: key);

  @override
  CarouselSliderState createState() => CarouselSliderState(_carouselController);
}

class CarouselSliderState extends State<CarouselSlider>
    with TickerProviderStateMixin {
  final CarouselController carouselController;

  Timer timer;

  CarouselOption get options => widget.options ?? CarouselOption();

  CarouselState carouselState;

  CarouselPageChangedReason mode = CarouselPageChangedReason.controller;

  CarouselSliderState(this.carouselController);

  void changeMode(CarouselPageChangedReason _mode) {
    mode = _mode;
  }

  @override
  void didUpdateWidget(CarouselSlider oldWidget) {
    carouselState.options = options;
    carouselState.itemCount = widget.itemCount;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    carouselState =
        CarouselState(this.options, clearTimer, resumeTimer, this.changeMode);

    carouselState.itemCount = widget.itemCount;
    carouselController.state = carouselState;
    carouselState.initIndex = widget.options.initIndex;
    carouselState.realIndex = options.isEnableLoop
        ? carouselState.realIndex + carouselState.initIndex
        : carouselState.initIndex;
    timer = getTimer();

    PageController pageController = PageController(
      viewportFraction: options.viewportFraction,
      initialPage: carouselState.realIndex,
    );

    carouselState.pageController = pageController;
  }

  Timer getTimer() {
    if (widget.options.autoPlay) {
      return Timer.periodic(widget.options.autoPlayInterval, (_) {
        CarouselPageChangedReason previousReason = mode;
        changeMode(CarouselPageChangedReason.timed);
        int nextPage = carouselState.pageController.page.round() + 1;
        int itemCount = widget.itemCount ?? widget.items.length;

        if (nextPage >= itemCount && widget.options.isEnableLoop == false) {
          if (widget.options.pauseAutoPlayInFiniteScroll) {
            clearTimer();
            return;
          }
          nextPage = 0;
        }

        carouselState.pageController
            .animateToPage(nextPage,
                duration: widget.options.autoPlayAnimationDuration,
                curve: widget.options.autoPlayCurve)
            .then((_) => changeMode(previousReason));
      });
    }
    return null;
  }

  void clearTimer() {
    if (widget.options.autoPlay) {
      timer?.cancel();
    }
  }

  void resumeTimer() {
    if (widget.options.autoPlay) {
      timer = getTimer();
    }
  }

  Widget getGestureWrapper(Widget child) {
    Widget wrapper;
    if (widget.options.height != null) {
      wrapper = Container(height: widget.options.height, child: child);
    } else {
      wrapper = AspectRatio(aspectRatio: widget.options.aspectRatio, child: child);
    }

    return RawGestureDetector(
      gestures: {
        _MultipleGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<_MultipleGestureRecognizer>(
                () => _MultipleGestureRecognizer(),
                (_MultipleGestureRecognizer instance) {
          instance.onStart = (_) {
            onStart();
          };
          instance.onDown = (_) {
            onPanDown();
          };
          instance.onEnd = (_) {
            onPanUp();
          };
          instance.onCancel = () {
            onPanUp();
          };
        }),
      },
      child: NotificationListener(
        onNotification: (notification) {
          if (widget.options.onScrolled != null &&
              notification is ScrollUpdateNotification) {
            widget.options.onScrolled(carouselState.pageController.page);
          }
          return false;
        },
        child: wrapper,
      ),
    );
  }

  Widget getCenterWrapper(Widget child) {
    if (widget.options.disableCenter) {
      return Container(
        child: child,
      );
    }
    return Center(child: child);
  }

  Widget getEnlargeWrapper(Widget child,
      {double width, double height, double scale}) {
    if (widget.options.enlargeStrategy == CenterPageEnlargeStrategy.normal) {
      return SizedBox(child: child, width: width, height: height);
    }
    return Transform.scale(scale: scale, child: Container(child: child, width: width, height: height));
  }

  void onStart() {
    changeMode(CarouselPageChangedReason.manual);
  }

  void onPanDown() {
    if (widget.options.pauseAutoPlayOnTouch) {
      clearTimer();
    }

    changeMode(CarouselPageChangedReason.manual);
  }

  void onPanUp() {
    if (widget.options.pauseAutoPlayOnTouch) {
      resumeTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    clearTimer();
  }

  @override
  Widget build(BuildContext context) {
    return getGestureWrapper(PageView.builder(
      physics: widget.options.scrollPhysics,
      scrollDirection: widget.options.scrollDirection,
      controller: carouselState.pageController,
      reverse: widget.options.isEnableReverse,
      itemCount: widget.options.isEnableLoop ? null : widget.itemCount,
      key: widget.options.pageViewKey,
      onPageChanged: (int index) {
        int currentPage = getRealIndex(index + carouselState.initIndex, carouselState.realIndex, widget.itemCount);
        if (widget.options.onPageChanged != null) {
          widget.options.onPageChanged(currentPage, mode);
        }
      },
      itemBuilder: (BuildContext context, int idx) {
        final int index = getRealIndex(idx + carouselState.initIndex, carouselState.realIndex, widget.itemCount);

        return AnimatedBuilder(
          animation: carouselState.pageController,
          child: (widget.items != null) ? (widget.items.length > 0 ? widget.items[index] : Container()) : widget.itemBuilder(context, index),
          builder: (BuildContext context, child) {
            double distortionValue = 1.0;
            if (widget.options.isEnableLargeCenterPage != null && widget.options.isEnableLargeCenterPage == true) {
              double itemOffset;
              if (carouselState.pageController.position.minScrollExtent == null || carouselState.pageController.position.maxScrollExtent == null) {
                BuildContext storageContext = carouselState.pageController.position.context.storageContext;
                final double previousSavedPosition = PageStorage.of(storageContext)?.readState(storageContext) as double;
                if (previousSavedPosition != null) {
                  itemOffset = previousSavedPosition - idx.toDouble();
                } else {
                  itemOffset = carouselState.realIndex.toDouble() - idx.toDouble();
                }
              } else {
                itemOffset = carouselState.pageController.page - idx;
              }
              final distortionRatio = (1 - (itemOffset.abs() * 0.3)).clamp(0.0, 1.0);
              distortionValue = Curves.easeOut.transform(distortionRatio);
            }

            final double height = widget.options.height ?? MediaQuery.of(context).size.width * (1 / widget.options.aspectRatio);

            if (widget.options.scrollDirection == Axis.horizontal) {
              return getCenterWrapper(getEnlargeWrapper(child, height: distortionValue * height, scale: distortionValue));
            } else {
              return getCenterWrapper(getEnlargeWrapper(child, width: distortionValue * MediaQuery.of(context).size.width, scale: distortionValue));
            }
          },
        );
      },
    ));
  }
}

class _MultipleGestureRecognizer extends PanGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
