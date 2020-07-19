// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    username: json['user_name'] as String,
    avatarUrl: json['avatar_url'] as String,
    coverUrl: json['cover_url'] as String,
    introduce: json['introduce'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user_name': instance.username,
      'avatar_url': instance.avatarUrl,
      'cover_url': instance.coverUrl,
      'introduce': instance.introduce,
    };
