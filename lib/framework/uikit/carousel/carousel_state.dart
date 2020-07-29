import 'package:eye_video/framework/uikit/carousel/carousel_option.dart';
import 'package:flutter/material.dart';

class CarouselState {
  CarouselOption options;

  PageController pageController;

  int realIndex = 10000;

  int initIndex = 0;

  int itemCount;

  Function onResetTimer;

  Function onResumeTimer;

  Function(CarouselPageChangedReason) changeMode;

  CarouselState(
      this.options, this.onResetTimer, this.onResumeTimer, this.changeMode);
}
