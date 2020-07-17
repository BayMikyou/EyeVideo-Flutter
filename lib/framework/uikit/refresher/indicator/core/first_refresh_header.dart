import 'package:eye_video/framework/uikit/refresher/indicator/core/abstract_header.dart';
import 'package:eye_video/framework/uikit/refresher/pretty_refresher.dart';
import 'package:eye_video/framework/uikit/refresher/sliver/sliver_refresh.dart';
import 'package:flutter/material.dart';

// 首次刷新Header
class FirstRefreshHeader extends Header {
  // 子组件
  final Widget child;

  FirstRefreshHeader(this.child)
      : super(
          extent: double.infinity,
          triggerDistance: 60.0,
          float: true,
          enableInfiniteRefresh: false,
          enableHapticFeedback: false,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      RefreshMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteRefresh,
      bool success,
      bool noMore) {
    return (refreshState == RefreshMode.armed ||
                refreshState == RefreshMode.refresh) &&
            pulledExtent >
                refreshTriggerPullDistance + PrettyRefresher.callOverExtent
        ? child
        : Container();
  }
}
