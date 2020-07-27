// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityModel _$CommunityModelFromJson(Map<String, dynamic> json) {
  return CommunityModel(
    (json['itemList'] as List)
        ?.map((e) =>
            e == null ? null : Community.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as int,
    json['total'] as int,
    json['nextPageUrl'] as String,
  );
}

Map<String, dynamic> _$CommunityModelToJson(CommunityModel instance) =>
    <String, dynamic>{
      'itemList': instance.communityList,
      'count': instance.count,
      'total': instance.total,
      'nextPageUrl': instance.nextPageUrl,
    };

Community _$CommunityFromJson(Map<String, dynamic> json) {
  return Community(
    json['type'] as String,
    json['data'] == null
        ? null
        : CommunityData.fromJson(json['data'] as Map<String, dynamic>),
    json['tag'] as String,
    json['id'] as int,
    json['adIndex'] as int,
  );
}

Map<String, dynamic> _$CommunityToJson(Community instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'tag': instance.tag,
      'id': instance.id,
      'adIndex': instance.adIndex,
    };

CommunityData _$CommunityDataFromJson(Map<String, dynamic> json) {
  return CommunityData(
    json['dataType'] as String,
    (json['itemList'] as List)
        ?.map((e) =>
            e == null ? null : Community.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as int,
    json['header'] == null
        ? null
        : HeaderData.fromJson(json['header'] as Map<String, dynamic>),
    json['content'] == null
        ? null
        : Community.fromJson(json['content'] as Map<String, dynamic>),
    json['consumption'] == null
        ? null
        : Consumption.fromJson(json['consumption'] as Map<String, dynamic>),
    (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['releaseTime'] as int,
    (json['urls'] as List)?.map((e) => e as String)?.toList(),
    json['city'] as String,
    (json['longitude'] as num)?.toDouble(),
    (json['latitude'] as num)?.toDouble(),
    json['image'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$CommunityDataToJson(CommunityData instance) =>
    <String, dynamic>{
      'dataType': instance.dataType,
      'itemList': instance.communityList,
      'count': instance.count,
      'header': instance.header,
      'content': instance.content,
      'consumption': instance.consumption,
      'tags': instance.tags,
      'releaseTime': instance.releaseTime,
      'urls': instance.urls,
      'city': instance.city,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'image': instance.image,
      'description': instance.description,
    };

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    json['name'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
    };

Consumption _$ConsumptionFromJson(Map<String, dynamic> json) {
  return Consumption(
    json['collectionCount'] as int,
    json['replyCount'] as int,
    json['shareCount'] as int,
    json['realCollectionCount'] as int,
  );
}

Map<String, dynamic> _$ConsumptionToJson(Consumption instance) =>
    <String, dynamic>{
      'collectionCount': instance.collectionCount,
      'replyCount': instance.replyCount,
      'shareCount': instance.shareCount,
      'realCollectionCount': instance.realCollectionCount,
    };

HeaderData _$HeaderDataFromJson(Map<String, dynamic> json) {
  return HeaderData(
    json['icon'] as String,
    json['issuerName'] as String,
  );
}

Map<String, dynamic> _$HeaderDataToJson(HeaderData instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'issuerName': instance.issuerName,
    };
