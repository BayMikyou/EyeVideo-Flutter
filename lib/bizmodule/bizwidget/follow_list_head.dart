import 'package:flutter/material.dart';

class FollowListHead extends StatelessWidget {
  final String title;
  final String avatarUrl;
  final String description;

  const FollowListHead({Key key, this.title, this.avatarUrl, this.description})
      : super(key: key);

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
        fontFamily: 'NotoSansHans-Medium',
      ),
    );

    var tvSubtitle = Text(
      description,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
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
            fontFamily: 'NotoSansHans-Regular',
            color: Color(0xff666666),
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

    return ListTile(
      leading: ivAvatar,
      contentPadding: EdgeInsets.zero,
      title: tvTitle,
      subtitle: tvSubtitle,
      trailing: btnFollow,
      onTap: () {},
    );
  }
}
