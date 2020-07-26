import 'package:eye_video/bizmodule/bizwidget/cover_image_item.dart';
import 'package:flutter/material.dart';

class SmallItemVideo extends StatelessWidget {
  final String coverUrl;
  final int duration;
  final String title;
  final String tag;

  const SmallItemVideo(
      {Key key, this.title, this.tag, this.coverUrl, this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      child: Wrap(
        spacing: 16,
        direction: Axis.horizontal,
        children: [
          CoverImageItem(
            width: MediaQuery.of(context).size.width * 0.5,
            coverUrl: coverUrl,
            duration: duration,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff333333),
                    fontFamily: 'NotoSansHans-Medium',
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.5 - 38,
                margin: EdgeInsets.only(top: 10, bottom: 30),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5 - 38,
                child: Text(
                  tag,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff666666),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
