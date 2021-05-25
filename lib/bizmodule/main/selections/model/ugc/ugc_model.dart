import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ugc_author_model.dart';
import 'ugc_tag_model.dart';

part 'ugc_model.g.dart';

@JsonSerializable()
class UgcModel extends Equatable {
  factory UgcModel.fromJson(Map<String, dynamic> json) =>
      _$UgcModelFromJson(json);

  Map<String, dynamic> toJson(instance) => _$UgcModelToJson(this);
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "category")
  final String category;

  @JsonKey(name: "cover")
  final String cover;

  @JsonKey(name: "coverBlurredBg")
  final String coverBlurredBg;

  @JsonKey(name: "playUrl")
  final String playUrl;

  @JsonKey(name: "duration")
  final int duration;

  @JsonKey(name: "syncTime")
  final String syncTime;

  @JsonKey(name: "author")
  final Author author;

  @JsonKey(name: "tags")
  final List<Tag> tags;

  UgcModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.cover,
    this.coverBlurredBg,
    this.playUrl,
    this.duration,
    this.syncTime,
    this.author,
    this.tags,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        category,
        cover,
        coverBlurredBg,
        playUrl,
        duration,
        syncTime,
        author,
        tags
      ];
}
