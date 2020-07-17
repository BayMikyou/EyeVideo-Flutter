import 'package:eye_video/bizmodule/main/selections/widgets/video_body_item.dart';
import 'package:flutter/material.dart';

class FollowItemVideo extends StatelessWidget {
  final String coverUrl;
  final int duration;
  final String avatarUrl;
  final String title;
  final String tag;

  const FollowItemVideo(
      {Key key,
      this.coverUrl,
      this.duration,
      this.avatarUrl,
      this.title,
      this.tag})
      : assert(coverUrl != null),
        assert(avatarUrl != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var ivAvatar = CircleAvatar(
      backgroundImage: NetworkImage(avatarUrl),
    );

    var tvTitle = Text(
      title,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xff333333),
        fontWeight: FontWeight.bold,
      ),
    );

    var tvSubtitle = Text(
      tag,
      style: TextStyle(
        fontSize: 12,
        color: Color(0xff666666),
      ),
    );

    var btnFollow = Container(
      width: 40,
      height: 20,
      child: OutlineButton(
        padding: EdgeInsets.all(0),
        child: Text(
          '+关注',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        borderSide: BorderSide(
          color: Color(0xff333333),
          width: 0.5,
          style: BorderStyle.solid,
        ),
        onPressed: () => null,
      ),
    );

    var widgetHeadItem = ListTile(
      leading: ivAvatar,
      contentPadding: EdgeInsets.zero,
      title: tvTitle,
      subtitle: tvSubtitle,
      trailing: btnFollow,
      onTap: () {},
    );

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          VideoBodyItem(
            coverUrl: coverUrl,
            duration: duration,
          ),
          widgetHeadItem
        ],
      ),
    );
  }
}
