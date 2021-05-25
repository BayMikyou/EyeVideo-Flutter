import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ugc_model.dart';

part 'ugc_list_model.g.dart';

@JsonSerializable()
class UgcListModel extends Equatable {
  factory UgcListModel.fromJson(Map<String, dynamic> json) =>
      _$UgcListModelFromJson(json);

  Map<String, dynamic> toJson(instance) => _$UgcListModelToJson(this);
  @JsonKey(name: "count")
  final int count;

  @JsonKey(name: "totalCount")
  final int totalCount;

  @JsonKey(name: "list")
  final List<UgcModel> list;

  @override
  List<Object> get props => [count, totalCount, list];

  UgcListModel({
    this.count,
    this.totalCount,
    this.list,
  });
}
