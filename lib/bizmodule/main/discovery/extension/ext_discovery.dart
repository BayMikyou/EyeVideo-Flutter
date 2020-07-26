import 'package:eye_video/bizmodule/main/discovery/model/discovery_model.dart';

extension ExtDiscovery on Discovery {
  bool get isHorizontalScrollCard =>
      this.type == 'horizontalScrollCard' &&
      this.data != null &&
      this.data.discoveryList.isNotEmpty &&
      this.data.discoveryList[0] != null &&
      this.data.discoveryList[0].data.dataType == 'Banner';

  bool get isSpecialSquareHeader =>
      type == 'specialSquareCardCollection' &&
      this.data != null &&
      this.data.header != null &&
      this.data.header.title != null;

  bool get isSpecialSquareCard =>
      type == 'specialSquareCardCollection' &&
      this.data != null &&
      this.data.discoveryList != null &&
      this.data.discoveryList.isNotEmpty &&
      this.data.discoveryList[0].type == 'squareCardOfCategory' &&
      this.data.discoveryList[0].data.dataType == 'SquareCard';

  bool get isColumnCardListHeader =>
      type == 'columnCardList' &&
      this.data != null &&
      this.data.header != null &&
      this.data.header.title != null;

  bool get isColumnCardList =>
      type == 'columnCardList' &&
      this.data != null &&
      this.data.discoveryList != null &&
      this.data.discoveryList.isNotEmpty &&
      this.data.discoveryList[0].type == 'squareCardOfColumn' &&
          this.data.discoveryList[0].data.dataType == 'SquareCard';

  bool get isHeaderCard =>
      type == 'textCard' && data != null && data.text.isNotEmpty;

  bool get isBriefCard =>
      type == 'briefCard' && data != null;
}
