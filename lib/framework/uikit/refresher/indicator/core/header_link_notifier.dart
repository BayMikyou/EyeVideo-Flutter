// 链接通知器
import 'package:eye_video/framework/uikit/refresher/sliver/sliver_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LinkHeaderNotifier extends ChangeNotifier {
  BuildContext context;
  RefreshMode refreshState = RefreshMode.inactive;
  double pulledExtent = 0.0;
  double refreshTriggerPullDistance;
  double refreshIndicatorExtent;
  AxisDirection axisDirection;
  bool float;
  Duration completeDuration;
  bool enableInfiniteRefresh;
  bool success = true;
  bool noMore = false;

  void contentBuilder(
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
    this.context = context;
    this.refreshState = refreshState;
    this.pulledExtent = pulledExtent;
    this.refreshTriggerPullDistance = refreshTriggerPullDistance;
    this.refreshIndicatorExtent = refreshIndicatorExtent;
    this.axisDirection = axisDirection;
    this.float = float;
    this.completeDuration = completeDuration;
    this.enableInfiniteRefresh = enableInfiniteRefresh;
    this.success = success;
    this.noMore = noMore;
    SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
      notifyListeners();
    });
  }
}
