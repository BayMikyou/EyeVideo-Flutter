import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildDrawerHeader(),
          buildExtendWidget(),
        ].followedBy(buildListTiles()).toList(),
      ),
    );
  }

  Widget buildDrawerHeader() {
    var userName = 'mikyou';
    var introduce = '专注一下';
    var coverUrl = 'http://img.kaiyanapp.com/8a93b20e5eaf3feef60eef882d29261b.jpeg?imageMogr2/quality/60/format/jpg';
    var avatarUrl = 'https://upload.jianshu.io/users/upload_avatars/3992846/618951f1-59e2-4309-a768-9bc0a15aa907.jpeg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240';
    return UserAccountsDrawerHeader(
      accountName: Text(
        userName,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      accountEmail: Text(
        introduce,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(coverUrl),
        ),
      ),
    );
  }

  Widget buildExtendWidget() {
    var extendDataMap = {
      '动态': 'assets/images/biz_app_icon_dynamic.png',
      '作品': 'assets/images/biz_app_icon_works.png',
      '关注': 'assets/images/biz_app_icon_attention.png',
      '粉丝': 'assets/images/biz_app_icon_fans.png'
    };
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: extendDataMap.keys.map((key) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              children: <Widget>[
                Image.asset(extendDataMap[key], width: 25, height: 25),
                Text(key, style: TextStyle(fontSize: 12))
              ],
            ),
          ),
          onTap: () => Navigator.pop(context),
        );
      }).toList(),
    );
  }

  List<Widget> buildListTiles() {
    var dataMap = {
      "日报精选": Icons.movie_filter,
      "附近动态": Icons.location_city,
      "我的喜欢": Icons.favorite,
      "我的关注": Icons.visibility,
      "divider1": Icons.line_style,
      "消息通知": Icons.notifications,
      "观看记录": Icons.history,
      "视频缓存": Icons.cloud_download,
      "divider2": Icons.line_style,
      "界面主题": Icons.color_lens,
      "意见反馈": Icons.help,
      "设置": Icons.settings
    };

    return dataMap.keys.map((key) {
      if (key == 'divider1' || key == 'divider2') {
        return Divider(
          height: 1,
          color: Colors.grey,
        );
      } else {
        return ListTile(
          leading: Icon(dataMap[key]),
          title: Text(key),
          onTap: () => Navigator.pop(context),
        );
      }
    }).toList();
  }
}
