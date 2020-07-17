import 'package:eye_video/bizmodule/main/selections/model/selection_model.dart';

extension ExtSelection on Selection {
  bool get isFollowCard =>
      type == 'followCard' &&
      data != null &&
      data.content != null &&
      data.content.data != null &&
      data.content.data.cover != null;

  bool get isSmallVideoCard =>
      type == 'videoSmallCard' && data != null && data.cover != null;

  bool get isHeaderCard =>
      type == 'textCard' &&
      data != null &&
      data.type == 'header5' &&
      data.text.isNotEmpty;

  bool get isSquareCard =>
      type == 'squareCardCollection' &&
      data != null &&
      data.header != null &&
      data.selectionList != null;
}
