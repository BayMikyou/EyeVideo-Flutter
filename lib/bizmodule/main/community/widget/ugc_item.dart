import 'package:eye_video/bizmodule/bizwidget/follow_list_head.dart';
import 'package:eye_video/bizmodule/main/community/extension/ext_community.dart';
import 'package:eye_video/bizmodule/main/community/model/community_model.dart';
import 'package:eye_video/framework/extension/screen_ruler.dart';
import 'package:eye_video/framework/uikit/layout/nine_layout.dart';
import 'package:flutter/material.dart';

class UgcFollowItem extends StatelessWidget {
  final HeaderData header;
  final CommunityData content;

  const UgcFollowItem({Key key, this.header, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    var headerItem = FollowListHead(
      title: header.issuerName,
      avatarUrl: header.icon,
      description: "${prettyTime(content.releaseTime)}发布",
    );
    children.add(headerItem);

    if (content.description != null && content.description.isNotEmpty) {
      var contentItem = Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          content.description,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'NotoSansHans-Regular',
            color: Color(0xff333333),
          ),
        ),
      );
      children.add(contentItem);
    }

    if (content.urls != null || content.urls.isNotEmpty) {
      var nineImages = Padding(
        padding: EdgeInsets.only(left: 8, top: 10, bottom: 10),
        child: NineLayout(
          width: MediaQuery.of(context).size.width - 34,
          children: content.urls.map((url) {
            return Container(
                decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ));
          }).toList(),
          count: content.urls.length,
          gap: 1,
        ),
      );

      children.add(nineImages);
    }

    if (content.tags != null && content.tags.isNotEmpty) {
      var tagItems = Container(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Wrap(
          children: content.tags
              .map((tag) => Container(
                    decoration: BoxDecoration(
                        color: Color(0xfff0f0f0),
                        borderRadius: BorderRadius.all(Radius.circular(15)),),
                    padding: EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 10),
                    child: Text(
                      tag.name,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ))
              .toList(),
        ),
      );
      children.add(tagItems);
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
