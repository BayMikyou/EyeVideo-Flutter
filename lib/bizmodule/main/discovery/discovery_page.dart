import 'package:eye_video/bizmodule/bizwidget/cover_image_item.dart';
import 'package:eye_video/bizmodule/bizwidget/follow_list_head.dart';
import 'package:eye_video/bizmodule/bizwidget/header_item.dart';
import 'package:eye_video/bizmodule/main/discovery/blocs/discovery_bloc.dart';
import 'package:eye_video/bizmodule/main/discovery/blocs/discovery_state.dart';
import 'package:eye_video/bizmodule/main/discovery/model/discovery_model.dart';
import 'package:eye_video/bizmodule/main/discovery/extension/ext_discovery.dart';
import 'package:eye_video/bizmodule/main/discovery/widgets/column_card_items.dart';
import 'package:eye_video/bizmodule/main/discovery/widgets/hot_category_items.dart';
import 'package:eye_video/framework/uikit/carousel/carousel_option.dart';
import 'package:eye_video/framework/uikit/carousel/carousel_slider.dart';
import 'package:eye_video/framework/uikit/scrollview/overscroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: BlocBuilder<DiscoveryBloc, DiscoveryState>(
        builder: (context, state) {
          if (state is StateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StateLoadFailure) {
            return Center(
              child: Text('数据请求失败'),
            );
          } else if (state is StateLoadSuccess) {
            return ScrollConfiguration(
              behavior: OverScrollBehavior(),
              child: ListView.builder(
                itemBuilder: (context, pos) =>
                    buildItemWidget(context, state, pos),
                itemCount: state.discoveryModel.discoveryList.length,
              ),
            );
          } else {
            return Center(
              child: Text('数据请求为空'),
            );
          }
        },
      ),
    );
  }

  Widget buildItemWidget(
      BuildContext context, StateLoadSuccess state, int pos) {
    Discovery itemData = state.discoveryModel.discoveryList[pos];
    if (itemData.isHorizontalScrollCard) {
      return CarouselSlider(
        options: CarouselOption(
          autoPlay: true,
          aspectRatio: 2.0,
          viewportFraction: 0.95,
          autoPlayInterval: Duration(seconds: 5),
          isEnableLargeCenterPage: true,
        ),
        items: itemData.data.discoveryList
            .map((discovery) => CoverImageItem(
                  coverUrl: discovery.data.image,
                ))
            .toList(),
      );
    } else if (itemData.isHeaderCard) {
      return HeaderItem(
        title: itemData.data.text,
      );
    } else if (itemData.isSpecialSquareCard) {
      List<Widget> children = <Widget>[];
      if (itemData.isSpecialSquareHeader) {
        var headerItem = HeaderItem(
          title: itemData.data.header.title,
        );
        children.add(headerItem);
      }
      children.add(HotCategoryItems(
        discoveryList: itemData.data.discoveryList,
      ));
      return Column(children: children);
    } else if (itemData.isColumnCardList) {
      List<Widget> children = <Widget>[];
      if (itemData.isColumnCardListHeader) {
        var headerItem = HeaderItem(
          title: itemData.data.header.title,
        );
        children.add(headerItem);
      }
      children.add(ColumnCardItems(
        discoveryList: itemData.data.discoveryList,
      ));
      return Column(children: children);
    } else if (itemData.isBriefCard) {
      return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: FollowListHead(
          title: itemData.data.title,
          avatarUrl: itemData.data.icon,
          description: itemData.data.description,
        ),
      );
    }
    return Center(
      child: Text('其他widget待开发'),
    );
  }
}
