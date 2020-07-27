import 'package:eye_video/bizmodule/main/selections/model/selection_model.dart';
import 'package:eye_video/bizmodule/main/selections/respositories/selection_repository.dart';
import 'package:eye_video/framework/network/pretty_http.dart';

class MockSelectionRepository extends SelectionRepository {
  @override
  Future<SelectionModel> fetchSelections({String nextPageUrl}) async {
    Map<String, dynamic> reqParams;
    if (nextPageUrl == null || nextPageUrl.isEmpty) {
      reqParams = {};
    } else {
      reqParams = Uri.parse(nextPageUrl).queryParameters;
    }
    var resData = await PrettyHttp.get(
      "api/v5/index/tab/allRec",
      reqParams: reqParams,
    );

    return Future.value(SelectionModel.fromJson(resData));
  }
}
