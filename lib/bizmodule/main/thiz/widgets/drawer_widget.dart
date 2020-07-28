import 'package:eye_video/bizmodule/main/thiz/blocs/main_bloc.dart';
import 'package:eye_video/bizmodule/main/thiz/blocs/main_state.dart';
import 'package:eye_video/bizmodule/main/thiz/model/drawer_configs.dart';
import 'package:eye_video/bizmodule/main/thiz/model/user_model.dart';
import 'package:eye_video/framework/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Drawer(
            child: getDrawerWidget(context, state),
          );
        },
      );
}

Widget getDrawerWidget(BuildContext context, MainState state) {
  if (state is DrawerLoadedErrorState) {
    return Center(
      child: Text('数据请求失败'),
    );
  } else if (state is DrawerLoadedState) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        buildDrawerHeader(state.userModel),
        buildExtendWidget(context, state.configsModel.extendConfigs),
      ]
          .followedBy(buildListTiles(context, state.configsModel.configs))
          .toList(),
    );
  } else {
    return Center(
      child: Text('数据为空'),
    );
  }
}

Widget buildDrawerHeader(UserModel userModel) {
  return UserAccountsDrawerHeader(
    accountName: Text(
      userModel.username,
      style: TextStyle(color: Colors.white, fontSize: 28.sp),
    ),
    accountEmail: Text(
      userModel.introduce,
      style: TextStyle(color: Colors.white, fontSize: 24.sp),
    ),
    currentAccountPicture: CircleAvatar(
      backgroundImage: NetworkImage(userModel.avatarUrl),
    ),
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(userModel.coverUrl),
      ),
    ),
  );
}

Widget buildExtendWidget(
    BuildContext context, List<DrawerConfig> extendConfigs) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: extendConfigs.map((config) {
      return GestureDetector(
        child: Tab(
          iconMargin: EdgeInsets.only(bottom: 12.dp),
          icon: Image.asset(config.assetIcon, width: 50.dp, height: 50.dp),
          child: Text(config.text, style: TextStyle(fontSize: 26.sp)),
        ),
        onTap: () => Navigator.pop(context),
      );
    }).toList(),
  );
}

List<Widget> buildListTiles(BuildContext context, List<DrawerConfig> configs) {
  return configs.map((config) {
    if (config.isDivider) {
      return Divider(
        height: 1.dp,
        color: Colors.grey,
      );
    } else {
      return ListTile(
        leading: Icon(config.iconData),
        title: Text(config.text, style: TextStyle(fontSize: 26.sp) ),
        onTap: () => Navigator.pop(context),
      );
    }
  }).toList();
}
