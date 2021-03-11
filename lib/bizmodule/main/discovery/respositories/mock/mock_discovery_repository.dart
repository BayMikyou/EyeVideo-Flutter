import 'package:eye_video/bizmodule/main/discovery/model/discovery_model.dart';
import 'package:eye_video/bizmodule/main/discovery/respositories/discovery_repository.dart';
import 'package:eye_video/framework/network/pretty_http.dart';

class MockDiscoveryRepository extends DiscoveryRepository {
  @override
  Future<DiscoveryModel> fetchDiscovery() async {
    var resData = await PrettyHttp.get("api/discovery/list");
    return Future.value(DiscoveryModel.fromJson(resData));
  }
}
