import 'dart:async';

import 'package:eye_video/framework/uikit/carousel/carousel_option.dart';
import 'package:eye_video/framework/uikit/carousel/carousel_state.dart';
import 'package:eye_video/framework/uikit/carousel/utils.dart';
import 'package:flutter/material.dart';


abstract class AbsCarouselController {
  bool get ready;

  Future<Null> get onReady;

  void nextPage({Duration duration, Curve curve});

  void prevPage({Duration duration, Curve curve});

  void seekToPage(int page);

  void seekToPageAnim(int page, {Duration duration, Curve curve});

  factory AbsCarouselController() => CarouselController();
}

class CarouselController implements AbsCarouselController {
  final Completer<Null> _readyCompleter = Completer<Null>();

  CarouselState _state;

  set state(CarouselState state) {
    _state = state;
    if (!_readyCompleter.isCompleted) {
      _readyCompleter.complete();
    }
  }

  void _setModeController() =>
      _state.changeMode(CarouselPageChangedReason.controller);

  @override
  bool get ready => _state != null;

  @override
  Future<Null> get onReady => _readyCompleter.future;

  @override
  Future<void> nextPage(
      {Duration duration = const Duration(milliseconds: 300),
      Curve curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state.onResetTimer();
    }
    await _state.pageController.nextPage(duration: duration, curve: curve);
    _setModeController();
    if (isNeedResetTimer) {
      _state.onResumeTimer();
    }
  }

  @override
  Future<void> prevPage(
      {Duration duration = const Duration(milliseconds: 300),
      Curve curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state.onResetTimer();
    }
    _setModeController();
    await _state.pageController.previousPage(duration: duration, curve: curve);
    if (isNeedResetTimer) {
      _state.onResumeTimer();
    }
  }

  @override
  void seekToPage(int page) {
    final index = getRealIndex(_state.pageController.page.toInt(),
        _state.realIndex - _state.initIndex, _state.itemCount);

    _setModeController();
    final int pageToJump = _state.pageController.page.toInt() + page - index;
    return _state.pageController.jumpToPage(pageToJump);
  }

  @override
  Future<void> seekToPageAnim(int page,
      {Duration duration = const Duration(milliseconds: 300),
      Curve curve = Curves.linear}) async {
    final bool isNeedResetTimer = _state.options.pauseAutoPlayOnManualNavigate;
    if (isNeedResetTimer) {
      _state.onResetTimer();
    }
    final index = getRealIndex(_state.pageController.page.toInt(),
        _state.realIndex - _state.initIndex, _state.itemCount);
    _setModeController();
    await _state.pageController.animateToPage(
        _state.pageController.page.toInt() + page - index,
        duration: duration,
        curve: curve);
    if (isNeedResetTimer) {
      _state.onResumeTimer();
    }
  }
}
