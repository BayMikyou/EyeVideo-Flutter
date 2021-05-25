// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ugc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UgcModel _$UgcModelFromJson(Map<String, dynamic> json) {
  return UgcModel(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    category: json['category'] as String,
    cover: json['cover'] as String,
    coverBlurredBg: json['coverBlurredBg'] as String,
    playUrl: json['playUrl'] as String,
    duration: json['duration'] as int,
    syncTime: json['syncTime'] as String,
    author: json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UgcModelToJson(UgcModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'cover': instance.cover,
      'coverBlurredBg': instance.coverBlurredBg,
      'playUrl': instance.playUrl,
      'duration': instance.duration,
      'syncTime': instance.syncTime,
      'author': instance.author,
      'tags': instance.tags,
    };
