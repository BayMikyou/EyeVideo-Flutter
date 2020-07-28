import 'package:flutter/material.dart';

class ScreenRuler {
  static ScreenRuler _instance;

  ScreenRuler._internal();

  factory ScreenRuler.getInstance() => _instance;

  static const int defaultWidth = 750;

  //UI设计中手机尺寸 , px
  num uiWidthPx;

  //控制字体是否要根据系统的“字体大小”辅助选项来进行缩放。默认值为false。
  bool allowFontScaling;

  static double _screenWidth;
  static double _screenHeight;
  static double _pixelRatio;
  static double _statusBarHeight;
  static double _bottomBarHeight;
  static double _textScaleFactor;

  static void init(BuildContext context,
      {num width = defaultWidth, bool allowFontScaling = false}) {
    if (_instance == null) {
      _instance = ScreenRuler._internal();
    }
    _instance.uiWidthPx = width;
    _instance.allowFontScaling = allowFontScaling;

    MediaQueryData mediaQuery = MediaQuery.of(context);
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  // 每个逻辑像素的字体像素数，字体的缩放比例
  static double get textScaleFactor => _textScaleFactor;

  // 设备的像素密度
  static double get pixelRatio => _pixelRatio;

  // 当前设备宽度 dp
  static double get screenWidth => _screenWidth;

  // 当前设备高度 dp
  static double get screenHeight => _screenHeight;

  // 当前设备宽度 px
  static double get screenWidthPx => _screenWidth * _pixelRatio;

  // 当前设备高度 px
  static double get screenHeightPx => _screenHeight * _pixelRatio;

  // 状态栏高度 dp 刘海屏会更高
  static double get statusBarHeight => _statusBarHeight;

  // 状态栏高度 dp 刘海屏会更高
  static double get statusBarHeightPx => _statusBarHeight * _pixelRatio;

  // 底部安全区距离 dp
  static double get bottomBarHeight => _bottomBarHeight;

  // 实际的dp与UI设计px的比例
  double get scale => screenWidth == 0 ? 0.5 : screenWidth / uiWidthPx;

  //根据UI设计的设备尺寸适配
  num compactDimenSize(num size) => size * scale;

  //根据UI设计的设备字体大小适配
  num compactScreenFontSize(num fontSize) => allowFontScaling
      ? (fontSize * scale)
      : ((fontSize * scale) / _textScaleFactor);
}