// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ugc_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    id: json['id'] as int,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };
