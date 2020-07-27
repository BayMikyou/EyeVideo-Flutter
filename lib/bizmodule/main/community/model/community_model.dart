import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'community_model.g.dart';

@JsonSerializable()
class CommunityModel extends Equatable {
  @JsonKey(name: 'itemList')
  final List<Community> communityList;

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'nextPageUrl')
  final String nextPageUrl;

  CommunityModel(this.communityList, this.count, this.total, this.nextPageUrl);

  @override
  List<Object> get props => [communityList, count, total, nextPageUrl];

  factory CommunityModel.fromJson(Map<String, dynamic> srcJson) =>
      _$CommunityModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommunityModelToJson(this);
}

@JsonSerializable()
class Community extends Equatable {
  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'data')
  final CommunityData data;

  @JsonKey(name: 'tag')
  final String tag;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'adIndex')
  final int adIndex;

  Community(this.type, this.data, this.tag, this.id, this.adIndex);

  factory Community.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$CommunityFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$CommunityToJson(this);

  @override
  List<Object> get props => [type, data, tag, id, adIndex];
}

@JsonSerializable()
class CommunityData extends Equatable {
  @JsonKey(name: 'dataType')
  final String dataType;

  @JsonKey(name: 'itemList')
  final List<Community> communityList;

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'header')
  final HeaderData header;

  @JsonKey(name: 'content')
  final Community content;

  @JsonKey(name: 'consumption')
  final Consumption consumption;

  @JsonKey(name: 'tags')
  final List<Tag> tags;

  @JsonKey(name: 'releaseTime')
  final int releaseTime;

  @JsonKey(name: 'urls')
  final List<String> urls;

  @JsonKey(name: 'city')
  final String city;

  @JsonKey(name: 'longitude')
  final double longitude;

  @JsonKey(name: 'latitude')
  final double latitude;

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'description')
  final String description;

  CommunityData(
      this.dataType,
      this.communityList,
      this.count,
      this.header,
      this.content,
      this.consumption,
      this.tags,
      this.releaseTime,
      this.urls,
      this.city,
      this.longitude,
      this.latitude,
      this.image,
      this.description);

  factory CommunityData.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$CommunityDataFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$CommunityDataToJson(this);

  @override
  List<Object> get props => [
        dataType,
        communityList,
        count,
        header,
        content,
        consumption,
        tags,
        releaseTime,
        urls,
        city,
        longitude,
        latitude,
        image,
        description
      ];
}

@JsonSerializable()
class Tag extends Equatable {
  @JsonKey(name: 'name')
  final String name;

  Tag(this.name);

  factory Tag.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$TagFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  List<Object> get props => [name];
}

@JsonSerializable()
class Consumption extends Equatable {
  @JsonKey(name: 'collectionCount')
  final int collectionCount;

  @JsonKey(name: 'replyCount')
  final int replyCount;

  @JsonKey(name: 'shareCount')
  final int shareCount;

  @JsonKey(name: 'realCollectionCount')
  final int realCollectionCount;

  Consumption(this.collectionCount, this.replyCount, this.shareCount,
      this.realCollectionCount);

  @override
  List<Object> get props =>
      [collectionCount, replyCount, shareCount, realCollectionCount];

  factory Consumption.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$ConsumptionFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$ConsumptionToJson(this);
}

@JsonSerializable()
class HeaderData extends Equatable {
  @JsonKey(name: 'icon')
  final String icon;

  @JsonKey(name: 'issuerName')
  final String issuerName;

  HeaderData(this.icon, this.issuerName);

  factory HeaderData.fromJson(Map<String, dynamic> srcJson) {
    try {
      return _$HeaderDataFromJson(srcJson);
    } catch (e) {
      print('$e');
    }
  }

  Map<String, dynamic> toJson() => _$HeaderDataToJson(this);

  @override
  List<Object> get props => [icon, issuerName];
}
