import 'package:eye_video/bizmodule/main/category/model/category_model.dart';
import 'package:eye_video/bizmodule/main/category/repositories/category_repository.dart';
import 'package:eye_video/framework/network/pretty_http.dart';

class MockCategoryRepository extends CategoryRepository {
  @override
  Future<CategoryModel> fetchCategories() async {
    var resData = await PrettyHttp.get('api/v4/categories/all', baseUrl: 'http://baobab.kaiyanapp.com/');
    return Future.value(CategoryModel.fromJson(resData));
  }
}
