// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    (json['itemList'] as List)
        ?.map((e) =>
            e == null ? null : CategoryList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['count'] as int,
    json['total'] as int,
    json['adExist'] as bool,
  );
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'itemList': instance.categoryList,
      'count': instance.count,
      'total': instance.total,
      'adExist': instance.adExist,
    };

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) {
  return CategoryList(
    json['type'] as String,
    json['data'] == null
        ? null
        : CategoryItem.fromJson(json['data'] as Map<String, dynamic>),
    json['id'] as int,
    json['adIndex'] as int,
  );
}

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.item,
      'id': instance.id,
      'adIndex': instance.adIndex,
    };

CategoryItem _$CategoryItemFromJson(Map<String, dynamic> json) {
  return CategoryItem(
    json['dataType'] as String,
    json['id'] as int,
    json['title'] as String,
    json['image'] as String,
    json['actionUrl'] as String,
    json['shade'] as bool,
  );
}

Map<String, dynamic> _$CategoryItemToJson(CategoryItem instance) =>
    <String, dynamic>{
      'dataType': instance.dataType,
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'actionUrl': instance.actionUrl,
      'shade': instance.shade,
    };
