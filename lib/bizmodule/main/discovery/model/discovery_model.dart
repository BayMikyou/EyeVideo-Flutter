import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discovery_model.g.dart';

@JsonSerializable()
class DiscoveryModel extends Equatable {
  @JsonKey(name: 'itemList')
  final List<Discovery> discoveryList;

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'nextPageUrl')
  final String nextPageUrl;

  @JsonKey(name: 'adExist')
  final bool adExist;

  DiscoveryModel(this.discoveryList, this.count, this.total, this.nextPageUrl,
      this.adExist);

  factory DiscoveryModel.fromJson(Map<String, dynamic> srcJson) =>
      _$DiscoveryModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DiscoveryModelToJson(this);

  @override
  List<Object> get props => [discoveryList, count, total, nextPageUrl, adExist];
}

@JsonSerializable()
class Discovery extends Equatable {
  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'data')
  final DiscoveryData data;

  @JsonKey(name: 'tag')
  final String tag;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'adIndex')
  final int adIndex;

  Discovery(this.type, this.data, this.tag, this.id, this.adIndex);

  factory Discovery.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$DiscoveryFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$DiscoveryToJson(this);

  @override
  List<Object> get props => [type, data, tag, id, adIndex];
}

@JsonSerializable()
class DiscoveryData extends Equatable {
  @JsonKey(name: 'dataType')
  final String dataType;

  @JsonKey(name: 'itemList')
  final List<Discovery> discoveryList;

  @JsonKey(name: 'header')
  final DiscoveryData header;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'text')
  final String text;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'subTitle')
  final String subTitle;

  @JsonKey(name: 'icon')
  final String icon;

  @JsonKey(name: 'iconType')
  final String iconType;

  @JsonKey(name: 'actionUrl')
  final String actionUrl;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'image')
  final String image;

  DiscoveryData(
      this.dataType,
      this.discoveryList,
      this.header,
      this.id,
      this.type,
      this.text,
      this.title,
      this.subTitle,
      this.icon,
      this.iconType,
      this.actionUrl,
      this.description,
      this.image);

  @override
  List<Object> get props => [
        dataType,
        discoveryList,
        header,
        id,
        type,
        text,
        title,
        subTitle,
        icon,
        iconType,
        actionUrl,
        description,
        image
      ];

  factory DiscoveryData.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$DiscoveryDataFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$DiscoveryDataToJson(this);
}
