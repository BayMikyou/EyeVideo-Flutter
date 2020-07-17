
import 'package:eye_video/framework/extension/screen_ruler.dart';

extension ScreenSizeExtension on num {
  //适配后的尺寸大小dp，包括长宽
  num get dp => ScreenRuler.getInstance().compactDimenSize(this);

  //适配后的字体大小
  num get sp => ScreenRuler.getInstance().compactScreenFontSize(this);
}
