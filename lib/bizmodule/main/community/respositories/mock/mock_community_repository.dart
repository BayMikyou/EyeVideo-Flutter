import 'package:eye_video/bizmodule/main/community/model/community_model.dart';
import 'package:eye_video/bizmodule/main/community/respositories/community_repository.dart';
import 'package:eye_video/framework/network/pretty_http.dart';

class MockCommunityRepository extends CommunityRepository {
  @override
  Future<CommunityModel> fetchCommunity({String nextPageUrl}) async {
    try {
      Map<String, dynamic> reqParams;
      if (nextPageUrl == null || nextPageUrl.isEmpty) {
        reqParams = {};
      } else {
        reqParams = Uri.parse(nextPageUrl).queryParameters;
      }
      var resData = await PrettyHttp.get(
        "api/v6/community/tab/rec",
        reqParams: reqParams,
      );
      return Future.value(CommunityModel.fromJson(resData));
    } catch (e) {
      return Future.error(e);
    }
  }
}
