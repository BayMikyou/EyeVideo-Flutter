import 'dart:async';
import 'dart:math';

import 'package:eye_video/framework/uikit/refresher/indicator/core/abstract_header.dart';
import 'package:eye_video/framework/uikit/refresher/sliver/sliver_refresh.dart';
import 'package:flutter/material.dart';


class ClassicHeader extends Header {
  // Key
  final Key key;

  // 方位
  final AlignmentGeometry alignment;

  // 提示刷新文字
  final String refreshText;

  // 准备刷新文字
  final String refreshReadyText;

  // 正在刷新文字
  final String refreshingText;

  // 刷新完成文字
  final String refreshedText;

  // 刷新失败文字
  final String refreshFailedText;

  // 没有更多文字
  final String noMoreText;

  // 显示额外信息(默认为时间)
  final bool showInfo;

  // 更多信息
  final String infoText;

  // 背景颜色
  final Color bgColor;

  // 字体颜色
  final Color textColor;

  // 更多信息文字颜色
  final Color infoColor;

  ClassicHeader({
    double extent = 60.0,
    double triggerDistance = 70.0,
    bool float = false,
    Duration completeDuration = const Duration(seconds: 1),
    bool enableInfiniteRefresh = false,
    bool enableHapticFeedback = true,
    this.key,
    this.alignment,
    this.refreshText,
    this.refreshReadyText,
    this.refreshingText,
    this.refreshedText,
    this.refreshFailedText,
    this.noMoreText,
    this.showInfo: true,
    this.infoText,
    this.bgColor: Colors.transparent,
    this.textColor: Colors.black,
    this.infoColor: Colors.teal,
  }) : super(
          extent: extent,
          triggerDistance: triggerDistance,
          float: float,
          completeDuration: float
              ? completeDuration == null
                  ? Duration(
                      milliseconds: 400,
                    )
                  : completeDuration +
                      Duration(
                        milliseconds: 400,
                      )
              : completeDuration,
          enableInfiniteRefresh: enableInfiniteRefresh,
          enableHapticFeedback: enableHapticFeedback,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      RefreshMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteRefresh,
      bool success,
      bool noMore) {
    return ClassicHeaderWidget(
      key: key,
      classicHeader: this,
      refreshState: refreshState,
      pulledExtent: pulledExtent,
      refreshTriggerPullDistance: refreshTriggerPullDistance,
      refreshIndicatorExtent: refreshIndicatorExtent,
      axisDirection: axisDirection,
      float: float,
      completeDuration: completeDuration,
      enableInfiniteRefresh: enableInfiniteRefresh,
      success: success,
      noMore: noMore,
    );
  }
}

class ClassicHeaderWidget extends StatefulWidget {
  final ClassicHeader classicHeader;
  final RefreshMode refreshState;
  final double pulledExtent;
  final double refreshTriggerPullDistance;
  final double refreshIndicatorExtent;
  final AxisDirection axisDirection;
  final bool float;
  final Duration completeDuration;
  final bool enableInfiniteRefresh;
  final bool success;
  final bool noMore;

  ClassicHeaderWidget(
      {Key key,
      this.refreshState,
      this.classicHeader,
      this.pulledExtent,
      this.refreshTriggerPullDistance,
      this.refreshIndicatorExtent,
      this.axisDirection,
      this.float,
      this.completeDuration,
      this.enableInfiniteRefresh,
      this.success,
      this.noMore})
      : super(key: key);

  @override
  ClassicHeaderWidgetState createState() => ClassicHeaderWidgetState();
}

class ClassicHeaderWidgetState extends State<ClassicHeaderWidget>
    with TickerProviderStateMixin<ClassicHeaderWidget> {
  // 是否到达触发刷新距离
  bool _overTriggerDistance = false;

  bool get overTriggerDistance => _overTriggerDistance;

  set overTriggerDistance(bool over) {
    if (_overTriggerDistance != over) {
      _overTriggerDistance
          ? _readyController.forward()
          : _restoreController.forward();
      _overTriggerDistance = over;
    }
  }

  // 文本
  String get _refreshText {
    return widget.classicHeader.refreshText ?? 'Pull to refresh';
  }

  String get _refreshReadyText {
    return widget.classicHeader.refreshReadyText ?? 'Release to refresh';
  }

  String get _refreshingText {
    return widget.classicHeader.refreshingText ?? 'Refreshing...';
  }

  String get _refreshedText {
    return widget.classicHeader.refreshedText ?? 'Refresh completed';
  }

  String get _refreshFailedText {
    return widget.classicHeader.refreshFailedText ?? 'Refresh failed';
  }

  String get _noMoreText {
    return widget.classicHeader.noMoreText ?? 'No more';
  }

  String get _infoText {
    return widget.classicHeader.infoText ?? 'Update at %T';
  }

  // 是否刷新完成
  bool _refreshFinish = false;

  set refreshFinish(bool finish) {
    if (_refreshFinish != finish) {
      if (finish && widget.float) {
        Future.delayed(widget.completeDuration - Duration(milliseconds: 400),
            () {
          if (mounted) {
            _floatBackController.forward();
          }
        });
        Future.delayed(widget.completeDuration, () {
          _floatBackDistance = null;
          _refreshFinish = false;
        });
      }
      _refreshFinish = finish;
    }
  }

  // 动画
  AnimationController _readyController;
  Animation<double> _readyAnimation;
  AnimationController _restoreController;
  Animation<double> _restoreAnimation;
  AnimationController _floatBackController;
  Animation<double> _floatBackAnimation;

  // Icon旋转度
  double _iconRotationValue = 1.0;

  // 浮动时,收起距离
  double _floatBackDistance;

  // 显示文字
  String get _showText {
    if (widget.noMore) return _noMoreText;
    if (widget.enableInfiniteRefresh) {
      if (widget.refreshState == RefreshMode.refreshed ||
          widget.refreshState == RefreshMode.inactive ||
          widget.refreshState == RefreshMode.drag) {
        return _finishedText;
      } else {
        return _refreshingText;
      }
    }
    switch (widget.refreshState) {
      case RefreshMode.refresh:
        return _refreshingText;
      case RefreshMode.armed:
        return _refreshingText;
      case RefreshMode.refreshed:
        return _finishedText;
      case RefreshMode.done:
        return _finishedText;
      default:
        if (overTriggerDistance) {
          return _refreshReadyText;
        } else {
          return _refreshText;
        }
    }
  }

  // 刷新结束文字
  String get _finishedText {
    if (!widget.success) return _refreshFailedText;
    if (widget.noMore) return _noMoreText;
    return _refreshedText;
  }

  // 刷新结束图标
  IconData get _finishedIcon {
    if (!widget.success) return Icons.error_outline;
    if (widget.noMore) return Icons.hourglass_empty;
    return Icons.done;
  }

  // 更新时间
  DateTime _dateTime;

  // 获取更多信息
  String get _infoTextStr {
    if (widget.refreshState == RefreshMode.refreshed) {
      _dateTime = DateTime.now();
    }
    String fillChar = _dateTime.minute < 10 ? "0" : "";
    return _infoText.replaceAll(
        "%T", "${_dateTime.hour}:$fillChar${_dateTime.minute}");
  }

  @override
  void initState() {
    super.initState();
    // 初始化时间
    _dateTime = DateTime.now();
    // 准备动画
    _readyController = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _readyAnimation = new Tween(begin: 0.5, end: 1.0).animate(_readyController)
      ..addListener(() {
        setState(() {
          if (_readyAnimation.status != AnimationStatus.dismissed) {
            _iconRotationValue = _readyAnimation.value;
          }
        });
      });
    _readyAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _readyController.reset();
      }
    });
    // 恢复动画
    _restoreController = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _restoreAnimation =
        new Tween(begin: 1.0, end: 0.5).animate(_restoreController)
          ..addListener(() {
            setState(() {
              if (_restoreAnimation.status != AnimationStatus.dismissed) {
                _iconRotationValue = _restoreAnimation.value;
              }
            });
          });
    _restoreAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _restoreController.reset();
      }
    });
    // float收起动画
    _floatBackController = new AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _floatBackAnimation =
        new Tween(begin: widget.refreshIndicatorExtent, end: 0.0)
            .animate(_floatBackController)
              ..addListener(() {
                setState(() {
                  if (_floatBackAnimation.status != AnimationStatus.dismissed) {
                    _floatBackDistance = _floatBackAnimation.value;
                  }
                });
              });
    _floatBackAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _floatBackController.reset();
      }
    });
  }

  @override
  void dispose() {
    _readyController.dispose();
    _restoreController.dispose();
    _floatBackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 是否为垂直方向
    bool isVertical = widget.axisDirection == AxisDirection.down ||
        widget.axisDirection == AxisDirection.up;
    // 是否反向
    bool isReverse = widget.axisDirection == AxisDirection.up ||
        widget.axisDirection == AxisDirection.left;
    // 是否到达触发刷新距离
    overTriggerDistance = widget.refreshState != RefreshMode.inactive &&
        widget.pulledExtent >= widget.refreshTriggerPullDistance;
    if (widget.refreshState == RefreshMode.refreshed) {
      refreshFinish = true;
    }
    return Stack(
      children: <Widget>[
        Positioned(
          top: !isVertical
              ? 0.0
              : isReverse
                  ? _floatBackDistance == null
                      ? 0.0
                      : (widget.refreshIndicatorExtent - _floatBackDistance)
                  : null,
          bottom: !isVertical
              ? 0.0
              : !isReverse
                  ? _floatBackDistance == null
                      ? 0.0
                      : (widget.refreshIndicatorExtent - _floatBackDistance)
                  : null,
          left: isVertical
              ? 0.0
              : isReverse
                  ? _floatBackDistance == null
                      ? 0.0
                      : (widget.refreshIndicatorExtent - _floatBackDistance)
                  : null,
          right: isVertical
              ? 0.0
              : !isReverse
                  ? _floatBackDistance == null
                      ? 0.0
                      : (widget.refreshIndicatorExtent - _floatBackDistance)
                  : null,
          child: Container(
            alignment: widget.classicHeader.alignment ?? isVertical
                ? isReverse ? Alignment.topCenter : Alignment.bottomCenter
                : !isReverse ? Alignment.centerRight : Alignment.centerLeft,
            width: isVertical
                ? double.infinity
                : _floatBackDistance == null
                    ? (widget.refreshIndicatorExtent > widget.pulledExtent
                        ? widget.refreshIndicatorExtent
                        : widget.pulledExtent)
                    : widget.refreshIndicatorExtent,
            height: isVertical
                ? _floatBackDistance == null
                    ? (widget.refreshIndicatorExtent > widget.pulledExtent
                        ? widget.refreshIndicatorExtent
                        : widget.pulledExtent)
                    : widget.refreshIndicatorExtent
                : double.infinity,
            color: widget.classicHeader.bgColor,
            child: SizedBox(
              height:
                  isVertical ? widget.refreshIndicatorExtent : double.infinity,
              width:
                  !isVertical ? widget.refreshIndicatorExtent : double.infinity,
              child: isVertical
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContent(isVertical, isReverse),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContent(isVertical, isReverse),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  // 构建显示内容
  List<Widget> _buildContent(bool isVertical, bool isReverse) {
    return isVertical
        ? <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                  right: 10.0,
                ),
                child: (widget.refreshState == RefreshMode.refresh ||
                            widget.refreshState == RefreshMode.armed) &&
                        !widget.noMore
                    ? Container(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: AlwaysStoppedAnimation(
                            widget.classicHeader.textColor,
                          ),
                        ),
                      )
                    : widget.refreshState == RefreshMode.refreshed ||
                            widget.refreshState == RefreshMode.done ||
                            (widget.enableInfiniteRefresh &&
                                widget.refreshState != RefreshMode.refreshed) ||
                            widget.noMore
                        ? Icon(
                            _finishedIcon,
                            color: widget.classicHeader.textColor,
                          )
                        : Transform.rotate(
                            child: Icon(
                              isReverse
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: widget.classicHeader.textColor,
                            ),
                            angle: 2 * pi * _iconRotationValue,
                          ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _showText,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: widget.classicHeader.textColor,
                    ),
                  ),
                  widget.classicHeader.showInfo
                      ? Container(
                          margin: EdgeInsets.only(
                            top: 2.0,
                          ),
                          child: Text(
                            _infoTextStr,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: widget.classicHeader.infoColor,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(),
            ),
          ]
        : <Widget>[
            Container(
              child: widget.refreshState == RefreshMode.refresh ||
                      widget.refreshState == RefreshMode.armed
                  ? Container(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation(
                          widget.classicHeader.textColor,
                        ),
                      ),
                    )
                  : widget.refreshState == RefreshMode.refreshed ||
                          widget.refreshState == RefreshMode.done ||
                          (widget.enableInfiniteRefresh &&
                              widget.refreshState != RefreshMode.refreshed) ||
                          widget.noMore
                      ? Icon(
                          _finishedIcon,
                          color: widget.classicHeader.textColor,
                        )
                      : Transform.rotate(
                          child: Icon(
                            isReverse ? Icons.arrow_back : Icons.arrow_forward,
                            color: widget.classicHeader.textColor,
                          ),
                          angle: 2 * pi * _iconRotationValue,
                        ),
            )
          ];
  }
}
