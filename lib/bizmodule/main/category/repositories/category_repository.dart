
import 'package:eye_video/bizmodule/main/category/model/category_model.dart';

abstract class CategoryRepository {
  Future<CategoryModel> fetchCategories();
}