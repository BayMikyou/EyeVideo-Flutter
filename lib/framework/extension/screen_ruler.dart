import 'dart:ui';

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

  static void init(
      {num width = defaultWidth,
      bool allowFontScaling = false}) {
    if (_instance == null) {
      _instance = ScreenRuler._internal();
    }
    _instance.uiWidthPx = width;
    _instance.allowFontScaling = allowFontScaling;
    _pixelRatio = window.devicePixelRatio;
    _screenWidth = window.physicalSize.width;
    _screenHeight = window.physicalSize.height;
    _statusBarHeight = window.padding.top;
    _bottomBarHeight = window.padding.bottom;
    _textScaleFactor = window.textScaleFactor;
  }

  // 每个逻辑像素的字体像素数，字体的缩放比例
  static double get textScaleFactor => _textScaleFactor;

  // 设备的像素密度
  static double get pixelRatio => _pixelRatio;

  // 当前设备宽度 dp
  static double get screenWidth => _screenWidth / _pixelRatio;

  // 当前设备高度 dp
  static double get screenHeight => _screenHeight / _pixelRatio;

  // 当前设备宽度 px
  static double get screenWidthPx => _screenWidth;

  // 当前设备高度 px
  static double get screenHeightPx => _screenHeight;

  // 状态栏高度 dp 刘海屏会更高
  static double get statusBarHeight => _statusBarHeight / _pixelRatio;

  // 状态栏高度 dp 刘海屏会更高
  static double get statusBarHeightPx => _statusBarHeight;

  // 底部安全区距离 dp
  static double get bottomBarHeight => _bottomBarHeight;

  // 实际的dp与UI设计px的比例
  double get scaleWidth => screenWidth / uiWidthPx;

  double get scaleText => scaleWidth;

  //根据UI设计的设备尺寸适配
  num compactDimenSize(num size) => size * scaleWidth;

  //根据UI设计的设备字体大小适配
  num compactScreenFontSize(num fontSize) => allowFontScaling ? (fontSize * scaleText) : ((fontSize * scaleText) / _textScaleFactor);
}
