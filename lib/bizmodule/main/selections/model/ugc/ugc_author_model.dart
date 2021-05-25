import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ugc_author_model.g.dart';

@JsonSerializable()
class Author extends Equatable {
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson(instance) => _$AuthorToJson(this);
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "icon")
  final String icon;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "description")
  final String description;

  Author({this.id, this.icon, this.name, this.description});

  @override
  List<Object> get props => [id, icon, name, description];
}
