import 'package:flutter/material.dart';

class OverScrollBehavior extends ScrollBehavior {
  final bool isShowLeading;
  final bool isShowTrailing;

  OverScrollBehavior({this.isShowLeading = true, this.isShowTrailing = true});

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          //不显示头部水波纹
          showLeading: false,
          //不显示尾部水波纹
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
        );
    }
    return child;
  }
}
