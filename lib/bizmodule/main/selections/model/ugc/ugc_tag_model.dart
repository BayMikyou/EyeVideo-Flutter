import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ugc_tag_model.g.dart';

@JsonSerializable()
class Tag extends Equatable {
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson(instance) => _$TagToJson(this);
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "text")
  final String text;

  Tag({
    this.id,
    this.text,
  });

  @override
  List<Object> get props => [id, text];
}
