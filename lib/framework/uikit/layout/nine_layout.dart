import 'package:flutter/material.dart';

//九宫格布局
class NineLayout extends StatelessWidget {
  final List<Widget> children;
  final double width;
  final int count;
  final double gap;

  NineLayout(
      {Key key, this.children, this.width, @required this.count, this.gap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate:
          NineLayoutDelegate(context: context, count: count, width: width),
      children: children,
    );
  }
}

class NineLayoutDelegate extends FlowDelegate {
  final BuildContext context;
  final double width;
  final int count;
  final double gap;

  NineLayoutDelegate({
    @required this.context,
    @required this.count,
    this.width = 300,
    this.gap = 5.0,
  });

  var columns = 3;
  var rows = 3;
  double itemW = 0;
  double itemH = 0;
  double totalW = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = gap;
    var y = 0.0;

    /// 需要重新计算,解决刷新值为0的问题
    getItemSize();
    getColumnsNumber(count);
    totalW = (itemW * rows) + (gap * (rows + 1));

    //计算每一个子widget的位置
    for (int i = 0; i < count; i++) {
      var w = context.getChildSize(i).width + x;
      if (w < totalW) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + gap;
      } else {
        x = gap;
        y += context.getChildSize(i).height + gap;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + gap;
      }
    }
  }

  getColumnsNumber(int length) {
    if (length <= 3) {
      rows = length;
      columns = 1;
    } else if (length <= 6) {
      rows = 3;
      columns = 2;
      if (length == 4) {
        rows = 2;
      }
    } else {
      rows = 3;
      columns = 3;
    }
  }

  getItemSize() {
    if (count == 1) {
      itemW = width;
      itemH = itemW / 2;
    } else if (count == 2) {
      itemW = (width - gap) / 2;
      itemH = itemW;
    } else if (count == 3) {
      itemW = (width - 2 * gap) / 3;
      itemH = itemW;
    } else if (count == 4) {
      itemW = (width - gap) / 2;
      itemH = itemW - 20;
    } else {
      itemW = (width - 2 * gap) / 3;
      itemH = itemW;
    }
  }

  getConstraintsForChild(int i, BoxConstraints constraints) {
    getItemSize();
    return BoxConstraints(
        minWidth: itemW, minHeight: itemH, maxWidth: itemW, maxHeight: itemH);
  }

  getSize(BoxConstraints constraints) {
    getColumnsNumber(count);
    getItemSize();
    double h = (columns * itemH) + ((columns - 1) * gap);
    totalW = (itemW * rows) + (gap * (rows + 1));
    return Size(totalW, h);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
