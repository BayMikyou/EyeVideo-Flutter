// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ugc_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UgcListModel _$UgcListModelFromJson(Map<String, dynamic> json) {
  return UgcListModel(
    count: json['count'] as int,
    totalCount: json['totalCount'] as int,
    list: (json['list'] as List)
        ?.map((e) =>
            e == null ? null : UgcModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UgcListModelToJson(UgcListModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'totalCount': instance.totalCount,
      'list': instance.list,
    };
