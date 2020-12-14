
import 'package:eye_video/framework/extension/screen_ruler.dart';

extension ScreenSizeExtension on num {
  //适配后的尺寸大小dp，包括长宽
//  num get dp => ScreenRuler.getInstance().compactDimenSize(this);
  num get dp => (this / 2.0).toDouble();

  //适配后的字体大小
//  num get sp => ScreenRuler.getInstance().compactScreenFontSize(this);
  num get sp => (this / 2.0).toDouble();
}
