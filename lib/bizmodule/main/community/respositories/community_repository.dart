import 'package:eye_video/bizmodule/main/community/model/community_model.dart';

abstract class CommunityRepository {
  Future<CommunityModel> fetchCommunity({String nextPageUrl});
}
