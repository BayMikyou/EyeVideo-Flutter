import 'package:equatable/equatable.dart';
import 'package:eye_video/bizmodule/main/category/model/category_model.dart';
import 'package:flutter/material.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];

  const CategoryState();
}

class StateLoadSuccess extends CategoryState {
  final CategoryModel categoryModel;

  const StateLoadSuccess({@required this.categoryModel})
      : assert(categoryModel != null);

  @override
  List<Object> get props => [categoryModel];
}

class StateLoadFailure extends CategoryState {
  List<Object> get props => [];
}

class StateLoading extends CategoryState {
  List<Object> get props => [];
}

class StateEmpty extends CategoryState {
  List<Object> get props => [];
}