import 'package:eye_video/bizmodule/blocs.dart';
import 'package:eye_video/bizmodule/main/category/model/category_model.dart';
import 'package:eye_video/bizmodule/main/category/repositories/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({@required this.categoryRepository}) : super(null) {
    add(EventRequestCategory()); //初始状态,手动添加首次请求事件
  }

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is EventRequestCategory) {
      yield StateLoading();
      try {
        final CategoryModel categoryModel =
            await categoryRepository.fetchCategories();
        if (categoryModel == null || categoryModel.categoryList.isEmpty) {
          yield StateEmpty();
        } else {
          yield StateLoadSuccess(categoryModel: categoryModel);
        }
      } catch (e) {
        yield StateLoadFailure();
      }
    }
  }
}
