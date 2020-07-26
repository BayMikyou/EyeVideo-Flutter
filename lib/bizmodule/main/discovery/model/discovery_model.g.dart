// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoveryModel _$DiscoveryModelFromJson(Map<String, dynamic> json) {
  return DiscoveryModel(
    (json['itemList'] as List)
        ?.map((e) =>
            e == null ? null : Discovery.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as int,
    json['total'] as int,
    json['nextPageUrl'] as String,
    json['adExist'] as bool,
  );
}

Map<String, dynamic> _$DiscoveryModelToJson(DiscoveryModel instance) =>
    <String, dynamic>{
      'itemList': instance.discoveryList,
      'count': instance.count,
      'total': instance.total,
      'nextPageUrl': instance.nextPageUrl,
      'adExist': instance.adExist,
    };

Discovery _$DiscoveryFromJson(Map<String, dynamic> json) {
  return Discovery(
    json['type'] as String,
    json['data'] == null
        ? null
        : DiscoveryData.fromJson(json['data'] as Map<String, dynamic>),
    json['tag'] as String,
    json['id'] as int,
    json['adIndex'] as int,
  );
}

Map<String, dynamic> _$DiscoveryToJson(Discovery instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'tag': instance.tag,
      'id': instance.id,
      'adIndex': instance.adIndex,
    };

DiscoveryData _$DiscoveryDataFromJson(Map<String, dynamic> json) {
  return DiscoveryData(
    json['dataType'] as String,
    (json['itemList'] as List)
        ?.map((e) =>
            e == null ? null : Discovery.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['header'] == null
        ? null
        : DiscoveryData.fromJson(json['header'] as Map<String, dynamic>),
    json['id'] as int,
    json['type'] as String,
    json['text'] as String,
    json['title'] as String,
    json['subTitle'] as String,
    json['icon'] as String,
    json['iconType'] as String,
    json['actionUrl'] as String,
    json['description'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$DiscoveryDataToJson(DiscoveryData instance) =>
    <String, dynamic>{
      'dataType': instance.dataType,
      'itemList': instance.discoveryList,
      'header': instance.header,
      'id': instance.id,
      'type': instance.type,
      'text': instance.text,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'icon': instance.icon,
      'iconType': instance.iconType,
      'actionUrl': instance.actionUrl,
      'description': instance.description,
      'image': instance.image,
    };
