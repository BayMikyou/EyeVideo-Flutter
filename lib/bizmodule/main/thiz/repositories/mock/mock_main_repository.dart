import 'package:eye_video/bizmodule/main/thiz/model/drawer_configs.dart';
import 'package:eye_video/bizmodule/main/thiz/model/user_model.dart';
import 'package:eye_video/bizmodule/main/thiz/repositories/main_repository.dart';
import 'package:flutter/material.dart';

class MockMainRepository extends MainRepository {
  @override
  Future<DrawerConfigsModel> fetchDrawerConfigs() {
    List<DrawerConfig> configs = [
      DrawerConfig(text: '日报精选', iconData: Icons.movie_filter),
      DrawerConfig(text: '附近动态', iconData: Icons.location_city),
      DrawerConfig(text: '我的喜欢', iconData: Icons.favorite),
      DrawerConfig(text: '我的关注', iconData: Icons.visibility),
      DrawerConfig(isDivider: true),
      DrawerConfig(text: '消息通知', iconData: Icons.notifications),
      DrawerConfig(text: '观看记录', iconData: Icons.history),
      DrawerConfig(text: '视频缓存', iconData: Icons.cloud_download),
      DrawerConfig(isDivider: true),
      DrawerConfig(text: '界面主题', iconData: Icons.color_lens),
      DrawerConfig(text: '意见反馈', iconData: Icons.help),
      DrawerConfig(text: '设置', iconData: Icons.settings),
    ];

    List<DrawerConfig> extendConfigs = [
      DrawerConfig(
          text: '动态', assetIcon: 'assets/images/biz_app_icon_dynamic.png'),
      DrawerConfig(
          text: '作品', assetIcon: 'assets/images/biz_app_icon_works.png'),
      DrawerConfig(
          text: '关注', assetIcon: 'assets/images/biz_app_icon_attention.png'),
      DrawerConfig(
          text: '粉丝', assetIcon: 'assets/images/biz_app_icon_fans.png'),
    ];

    DrawerConfigsModel drawerConfigs = DrawerConfigsModel(
      configs: configs,
      extendConfigs: extendConfigs,
    );

    return Future.value(drawerConfigs);
  }

  @override
  Future<UserModel> fetchUserInfo() {
    UserModel user = UserModel(
        username: 'Flutter',
        introduce: '专注一下',
        coverUrl:
            'http://img.kaiyanapp.com/8a93b20e5eaf3feef60eef882d29261b.jpeg?imageMogr2/quality/60/format/jpg',
        avatarUrl:
            'https://upload.jianshu.io/users/upload_avatars/3992846/618951f1-59e2-4309-a768-9bc0a15aa907.jpeg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240');

    return Future.value(user);
  }
}
