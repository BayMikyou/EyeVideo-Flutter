// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ugc_author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    id: json['id'] as int,
    icon: json['icon'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'description': instance.description,
    };
