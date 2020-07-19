import 'package:eye_video/bizmodule/main/thiz/model/drawer_configs.dart';
import 'package:eye_video/bizmodule/main/thiz/model/user_model.dart';

abstract class MainRepository {
  Future<UserModel> fetchUserInfo();

  Future<DrawerConfigsModel> fetchDrawerConfigs();
}
