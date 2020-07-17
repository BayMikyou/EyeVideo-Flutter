import 'package:eye_video/bizmodule/main/selections/model/selection_model.dart';

abstract class SelectionRepository {
  Future<SelectionModel> fetchSelections({String nextPageUrl});
}
