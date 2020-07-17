// 链接通知器
import 'package:eye_video/framework/uikit/refresher/sliver/sliver_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LinkFooterNotifier extends ChangeNotifier {
  BuildContext context;
  LoadMode loadState = LoadMode.inactive;
  double pulledExtent = 0.0;
  double loadTriggerPullDistance;
  double loadIndicatorExtent;
  AxisDirection axisDirection;
  bool float;
  Duration completeDuration;
  bool enableInfiniteLoad;
  bool success = true;
  bool noMore = false;

  void contentBuilder(
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
      bool noMore) {
    this.context = context;
    this.loadState = loadState;
    this.pulledExtent = pulledExtent;
    this.loadTriggerPullDistance = loadTriggerPullDistance;
    this.loadIndicatorExtent = loadIndicatorExtent;
    this.axisDirection = axisDirection;
    this.float = float;
    this.completeDuration = completeDuration;
    this.enableInfiniteLoad = enableInfiniteLoad;
    this.success = success;
    this.noMore = noMore;
    SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
      notifyListeners();
    });
  }
}
