import 'package:eye_video/framework/uikit/refresher/pretty_refresher.dart';
import 'package:eye_video/framework/uikit/refresher/sliver/sliver_loading.dart';
import 'package:flutter/material.dart';

abstract class Footer {
  // Footer容器高度
  final double extent;

  // 高度(超过这个高度触发加载)
  final double triggerDistance;
  @Deprecated('目前还没有找到方案,设置无效')
  final bool float;
  // 完成延时
  final Duration completeDuration;

  // 是否开启无限加载
  final bool enableInfiniteLoad;

  // 开启震动反馈
  final bool enableHapticFeedback;

  // 越界滚动(enableInfiniteLoad为true生效)
  final bool overScroll;

  Footer({
    this.extent = 60.0,
    this.triggerDistance = 70.0,
    this.float = false,
    this.completeDuration,
    this.enableInfiniteLoad = true,
    this.enableHapticFeedback = false,
    this.overScroll = false,
  });

  // 构造器
  Widget builder(
      BuildContext context,
      PrettyRefresher polestarRefresh,
      ValueNotifier<bool> focusNotifier,
      ValueNotifier<TaskState> taskNotifier,
      ValueNotifier<bool> callLoadNotifier) {
    return RefreshSliverLoadControl(
      loadIndicatorExtent: extent,
      loadTriggerPullDistance: triggerDistance,
      builder: contentBuilder,
      completeDuration: completeDuration,
      onLoad: polestarRefresh.onLoad,
      focusNotifier: focusNotifier,
      taskNotifier: taskNotifier,
      callLoadNotifier: callLoadNotifier,
      taskIndependence: polestarRefresh.taskIndependence,
      enableControlFinishLoad: polestarRefresh.enableControlFinishLoad,
      enableInfiniteLoad: enableInfiniteLoad,
      enableHapticFeedback: enableHapticFeedback,
      bindLoadIndicator: (finishLoad, resetLoadState) {
        if (polestarRefresh.controller != null) {
          polestarRefresh.controller.finishLoadCallBack = finishLoad;
          polestarRefresh.controller.resetLoadStateCallBack = resetLoadState;
        }
      },
    );
  }

  // Header构造器
  Widget contentBuilder(
      BuildContext context,
      LoadMode loadState,
      double pulledExtent,
      double loadTriggerPullDistance,
      double loadIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteLoad,
      bool success,
      bool noMore);
}