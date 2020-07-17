import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  @JsonKey(name: 'itemList')
  final List<CategoryList> categoryList;

  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'adExist')
  final bool adExist;

  CategoryModel(this.categoryList, this.count, this.total, this.adExist);

  factory CategoryModel.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  List<Object> get props => [categoryList, count, total, adExist];
}

@JsonSerializable()
class CategoryList extends Equatable {
  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'data')
  final CategoryItem item;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'adIndex')
  final int adIndex;

  CategoryList(this.type, this.item, this.id, this.adIndex);

  factory CategoryList.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);

  @override
  List<Object> get props => [
    type,
    item,
    id,
    adIndex
  ];
}

@JsonSerializable()
class CategoryItem extends Equatable {
  @JsonKey(name: 'dataType')
  final String dataType;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'actionUrl')
  final String actionUrl;

  @JsonKey(name: 'shade')
  final bool shade;

  CategoryItem(this.dataType, this.id, this.title, this.image, this.actionUrl,
      this.shade);

  factory CategoryItem.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);

  @override
  List<Object> get props => [
    dataType,
    id,
    title,
    image,
    actionUrl,
    shade
  ];
}
