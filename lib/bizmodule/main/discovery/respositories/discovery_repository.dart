import 'package:eye_video/bizmodule/main/discovery/model/discovery_model.dart';

abstract class DiscoveryRepository {
  Future<DiscoveryModel> fetchDiscovery();
}
