import 'package:eye_video/bizmodule/main/community/model/community_model.dart';

const int _MINUTE = 60; // 1分钟
const int _HOUR = 60 * _MINUTE; // 1小时
const int _DAY = 24 * _HOUR; // 1天
const int _MONTH = 31 * _DAY; // 月
const int _YEAR = 12 * _MONTH; // 年

String prettyTime(int timeMillis) {
  if (timeMillis < 0) return "";
  var currentMills = DateTime.now().millisecondsSinceEpoch;
  int seconds = (currentMills - timeMillis) ~/ 1000;
  if (seconds <= 0) {
    return "刚刚";
  }

  if (seconds < 60) {
    return "${seconds.toString()}秒前";
  }

  int minutes = seconds ~/ _MINUTE;
  if (seconds < 60) {
    return "${minutes.toString()}分钟前";
  }

  int hours = seconds ~/ _HOUR;
  if (hours < 24) {
    return "${hours.toString()}小时前";
  }

  int days = seconds ~/ _DAY;
  if (days < 31) {
    return "${days.toString()}天前";
  }

  int months = seconds ~/ _MONTH;
  if (months < 12) {
    return "${months.toString()}月前";
  }

  int years = seconds ~/ _YEAR;
  return "${years.toString()}年前";
}

extension ExtCommunity on Community {
  bool get isHorizontalScrollCard =>
      this.type == 'horizontalScrollCard' &&
      data != null &&
      data.dataType == 'HorizontalScrollCard' &&
      data.communityList.isNotEmpty;

  bool get isPicFollowCard =>
      this.type == 'pictureFollowCard' &&
      data != null &&
      data.dataType == 'FollowCard' &&
      data.header != null &&
      data.content != null;
}
