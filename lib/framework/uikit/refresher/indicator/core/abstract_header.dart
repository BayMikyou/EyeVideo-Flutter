import 'package:eye_video/framework/uikit/refresher/pretty_refresher.dart';
import 'package:eye_video/framework/uikit/refresher/sliver/sliver_refresh.dart';
import 'package:flutter/material.dart';

abstract class Header {
  // Header容器高度
  final double extent;

  // 触发刷新高度
  final double triggerDistance;

  // 是否浮动
  final bool float;

  // 完成延时
  final Duration completeDuration;

  // 是否开启无限刷新
  final bool enableInfiniteRefresh;

  // 开启震动反馈
  final bool enableHapticFeedback;

  // 越界滚动(enableInfiniteRefresh为true生效)
  final bool overScroll;

  Header({
    this.extent = 60.0,
    this.triggerDistance = 70.0,
    this.float = false,
    this.completeDuration,
    this.enableInfiniteRefresh = false,
    this.enableHapticFeedback = false,
    this.overScroll = true,
  });

  // 构造器
  Widget builder(
      BuildContext context,
      PrettyRefresher polestarRefresh,
      ValueNotifier<bool> focusNotifier,
      ValueNotifier<TaskState> taskNotifier,
      ValueNotifier<bool> callRefreshNotifier) {
    return RefreshSliverRefreshControl(
      refreshIndicatorExtent: extent,
      refreshTriggerPullDistance: triggerDistance,
      builder: contentBuilder,
      completeDuration: completeDuration,
      onRefresh: polestarRefresh.onRefresh,
      focusNotifier: focusNotifier,
      taskNotifier: taskNotifier,
      callRefreshNotifier: callRefreshNotifier,
      taskIndependence: polestarRefresh.taskIndependence,
      enableControlFinishRefresh: polestarRefresh.enableControlFinishRefresh,
      enableInfiniteRefresh: enableInfiniteRefresh && !float,
      enableHapticFeedback: enableHapticFeedback,
      headerFloat: float,
      bindRefreshIndicator: (finishRefresh, resetRefreshState) {
        if (polestarRefresh.controller != null) {
          polestarRefresh.controller.finishRefreshCallBack = finishRefresh;
          polestarRefresh.controller.resetRefreshStateCallBack =
              resetRefreshState;
        }
      },
    );
  }

  // Header构造器
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
      bool noMore);
}