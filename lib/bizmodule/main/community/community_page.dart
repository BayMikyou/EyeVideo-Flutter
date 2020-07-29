import 'package:eye_video/bizmodule/bizwidget/cover_image_item.dart';
import 'package:eye_video/bizmodule/main/community/blocs/community_bloc.dart';
import 'package:eye_video/bizmodule/main/community/blocs/community_event.dart';
import 'package:eye_video/bizmodule/main/community/blocs/community_state.dart';
import 'package:eye_video/bizmodule/main/community/extension/ext_community.dart';
import 'package:eye_video/bizmodule/main/community/widget/ugc_item.dart';
import 'package:eye_video/framework/extension/context_extension.dart';
import 'package:eye_video/framework/uikit/carousel/carousel_option.dart';
import 'package:eye_video/framework/uikit/carousel/carousel_slider.dart';
import 'package:eye_video/framework/uikit/refresher/indicator/material/material_footer.dart';
import 'package:eye_video/framework/uikit/refresher/indicator/material/material_header.dart';
import 'package:eye_video/framework/uikit/refresher/pretty_refresher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityPage extends StatelessWidget {
  final RefreshController _controller = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityBloc, CommunityState>(
      builder: (context, state) {
        if (state is StateRequestLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is StateRequestEmpty) {
          return Center(
            child: Text('数据请求为空'),
          );
        } else if (state is StateRequestFailure) {
          return Center(
            child: Text('数据请求失败'),
          );
        } else if (state is StateRequestSuccess) {
          return PrettyRefresher(
            header: MaterialHeader(),
            footer: MaterialFooter(),
            enableControlFinishLoad: false,
            enableControlFinishRefresh: false,
            controller: _controller,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: state.communityList
                  .where((element) =>
                      element.isHorizontalScrollCard || element.isPicFollowCard)
                  .length,
              itemBuilder: (BuildContext context, int pos) {
                return buildItemWidget(context, state, pos);
              },
            ),
            onLoad: () async {
              if (!state.hasNextPage) {
                _controller.finishLoad(noMore: true);
                context.showSnackBar(msg: '已经到底了～');
              } else {
                BlocProvider.of<CommunityBloc>(context)
                    .add(EventRequest(isFirst: false, isRefresh: false));
              }
            },
            onRefresh: () async {
              BlocProvider.of<CommunityBloc>(context)
                  .add(EventRequest(isFirst: false, isRefresh: true));
              _controller.resetLoadState();
            },
          );
        }
        return Container();
      },
    );
  }

  Widget buildItemWidget(
      BuildContext context, StateRequestSuccess state, int pos) {
    var itemList = state.communityList
        .where((element) =>
            element.isHorizontalScrollCard || element.isPicFollowCard)
        .toList();
    var itemData = itemList[pos];
    if (itemData.isHorizontalScrollCard) {
      return CarouselSlider(
        options: CarouselOption(
          autoPlay: true,
          aspectRatio: 2.0,
          viewportFraction: 0.95,
          autoPlayInterval: Duration(seconds: 5),
          isEnableLargeCenterPage: true,
        ),
        items: itemData.data.communityList
            .map((discovery) => CoverImageItem(
                  coverUrl: discovery.data.image,
                ))
            .toList(),
      );
    }
    if (itemData.isPicFollowCard) {
      return UgcFollowItem(
        header: itemData.data.header,
        content: itemData.data.content.data,
      );
    }
    return Container();
  }
}
