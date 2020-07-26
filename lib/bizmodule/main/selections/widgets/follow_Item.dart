import 'package:eye_video/bizmodule/bizwidget/cover_image_item.dart';
import 'package:eye_video/bizmodule/bizwidget/follow_list_head.dart';
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
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          CoverImageItem(
            coverUrl: coverUrl,
            duration: duration,
          ),
          FollowListHead(
            title: title,
            avatarUrl: avatarUrl,
            description: tag,
          ),
        ],
      ),
    );
  }
}
