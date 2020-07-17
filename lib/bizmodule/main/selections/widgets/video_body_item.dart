import 'package:flutter/material.dart';

class VideoBodyItem extends StatelessWidget {
  final double width;
  final String coverUrl;
  final int duration;

  const VideoBodyItem({Key key, this.width: 0, this.coverUrl, this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tvTimeLabel = Container(
      decoration: ShapeDecoration(
        color: Color(0xff333333),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6, top: 1, right: 6, bottom: 1),
        child: Text(
          getTimeLabel(duration),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Oswald-Regular',
            color: Color(0xffffffff),
          ),
        ),
      ),
    );

    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        Container(
          width: width == 0 ? double.infinity : width,
          height: (width == 0 ? MediaQuery.of(context).size.width : width) * 0.5,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage(coverUrl),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Positioned(
          child: tvTimeLabel,
          bottom: 3,
          right: 3,
        ),
      ],
    );
  }

  String getTimeLabel(int duration) {
    if (duration < 60) {
      return "00 : $duration";
    } else if (duration >= 60) {
      int minute = duration ~/ 60;
      int second = duration % 60;
      String minuteStr = minute < 10 ? "0$minute" : "$minute";
      String secondStr = second < 10 ? "0$second" : "$second";
      return "$minuteStr : $secondStr";
    }
    return "00 : 00";
  }
}
