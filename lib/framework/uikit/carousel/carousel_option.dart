import 'package:flutter/material.dart';

enum CarouselPageChangedReason { timed, manual, controller }

enum CenterPageEnlargeStrategy { scale, normal }

class CarouselOption {
  //设置轮播组件的高度，如果aspectRatio设置就会使用aspectRatio计算的高度
  final double height;

  //如果没有设置height就会使用宽高比aspectRatio，默认是16:9
  final double aspectRatio;

  //每个页面应占据的轮播窗口比例, 默认是0.8
  final double viewportFraction;

  //初始index, 默认为0
  final int initIndex;

  //是否开启无限循环, 默认true(开启)
  final bool isEnableLoop;

  //是否开启数据反序，默认false(关闭)
  final bool isEnableReverse;

  //是否开启自动播放, 默认true(开启)
  final bool autoPlay;

  //自动播放时间间隔
  final Duration autoPlayInterval;

  //自动播放动画切换时间
  final Duration autoPlayAnimationDuration;

  //自动播放动画插值器
  final Curve autoPlayCurve;

  //是否开启当前页面尺寸大于侧面图，主要凸显切换大小过渡动画
  final bool isEnableLargeCenterPage;

  //滚动方向， 默认是horizontal水平滚动
  final Axis scrollDirection;

  //页面切换的回调
  final Function(int index, CarouselPageChangedReason reason) onPageChanged;

  //页面滚动回调值
  final ValueChanged<double> onScrolled;

  //轮播应如何响应用户输入。例如，确定用户停止拖动页面视图后项目如何继续进行动画处理。
  final ScrollPhysics scrollPhysics;

  //如果为true，则自动播放功能在用户与轮播互动时会暂停，在用户完成互动后会恢复。 默认为`true`
  final bool pauseAutoPlayOnTouch;

  //如果为true，则自动播放功能在用户与轮播互动时会暂停，在用户完成交互后会恢复。默认为true
  final bool pauseAutoPlayOnManualNavigate;

  //如果enableInfiniteScroll是false，而autoPlay是true，则此选项
  // 决定轮播是否应到达最后一个项目而转到第一个项目。
  // 如果设置为“ true”，则自动播放到达最后一项时将暂停。
  // 如果设置为“ false”，则自动播放功能将在第一项
  // 位于最后一项时为其动画。
  final bool pauseAutoPlayInFiniteScroll;

  //如果要在重新创建页面视图时保持其位置，请传递一个“ PageStoragekey”。
  final PageStorageKey pageViewKey;

  //确定哪种方法可以放大中心页面
  final CenterPageEnlargeStrategy enlargeStrategy;

  //是否禁用每张幻灯片的“居中”小部件
  final bool disableCenter;

  CarouselOption(
      {this.height,
      this.aspectRatio: 16 / 9,
      this.viewportFraction: 0.8,
      this.initIndex: 0,
      this.isEnableLoop: true,
      this.isEnableReverse: false,
      this.autoPlay: true,
      this.autoPlayInterval: const Duration(seconds: 4),
      this.autoPlayAnimationDuration: const Duration(milliseconds: 800),
      this.autoPlayCurve: Curves.fastOutSlowIn,
      this.isEnableLargeCenterPage = false,
      this.onPageChanged,
      this.onScrolled,
      this.scrollPhysics,
      this.scrollDirection: Axis.horizontal,
      this.pauseAutoPlayOnTouch: true,
      this.pauseAutoPlayOnManualNavigate: true,
      this.pauseAutoPlayInFiniteScroll: false,
      this.pageViewKey,
      this.enlargeStrategy: CenterPageEnlargeStrategy.scale,
      this.disableCenter: false});
}
