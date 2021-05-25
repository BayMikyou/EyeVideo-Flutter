import 'package:eye_video/bizmodule/main/selections/model/ugc/ugc_list_model.dart';
import 'package:eye_video/bizmodule/main/selections/respositories/ugc_repository.dart';
import 'package:eye_video/framework/network/pretty_http.dart';

class MockUgcRepository extends UgcRepository {
  @override
  Future<UgcListModel> fetchUgcList({int page, int pageSize = 20}) async {
    var reqParams = <String, dynamic>{
      'page': page,
      'pageSize': pageSize,
    };

    var response = await PrettyHttp.get(
      "api/v1/ugc/list",
      baseUrl: "http://www.youkmi.cn:8889/eyes/",
      reqParams: reqParams,
    );

    return Future.value(UgcListModel.fromJson(response["data"]));
  }
}
