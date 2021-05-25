import 'package:eye_video/bizmodule/main/selections/blocs/ugc/ugc_bloc.dart';
import 'package:eye_video/bizmodule/main/selections/blocs/ugc/ugc_state.dart';
import 'package:eye_video/bizmodule/main/selections/widgets/follow_Item.dart';
import 'package:eye_video/framework/extension/context_extension.dart';
import 'package:eye_video/framework/uikit/carousel/carousel_option.dart';
import 'package:eye_video/framework/uikit/carousel/carousel_slider.dart';
import 'package:eye_video/framework/uikit/refresher/indicator/material/material_footer.dart';
import 'package:eye_video/framework/uikit/refresher/indicator/material/material_header.dart';
import 'package:eye_video/framework/uikit/refresher/pretty_refresher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/ugc/ugc_event.dart';
import 'widgets/small_video_item.dart';

class UgcPage extends StatelessWidget {
  final RefreshController _controller = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UgcBloc, UgcState>(builder: (context, state) {
      if (state is UgcStateRequestLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is UgcStateRequestEmpty) {
        return Center(
          child: Text('数据请求为空'),
        );
      } else if (state is UgcStateRequestFailure) {
        return Center(
          child: Text('数据请求失败'),
        );
      } else if (state is UgcStateRequestSuccess) {
        return PrettyRefresher(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          enableControlFinishLoad: false,
          enableControlFinishRefresh: false,
          controller: _controller,
          child: ListView.builder(
            itemCount: state.ugcList.length,
            itemBuilder: (BuildContext context, int pos) {
              return buildItemWidget(context, state, pos);
            },
          ),
          onLoad: () async {
            if (!state.hasNextPage) {
              _controller.finishLoad(noMore: true);
              context.showSnackBar(msg: '已经到底了～');
            } else {
              BlocProvider.of<UgcBloc>(context)
                  .add(UgcEventRequest(isFirst: false, isRefresh: false));
            }
          },
          onRefresh: () async {
            BlocProvider.of<UgcBloc>(context)
                .add(UgcEventRequest(isFirst: false, isRefresh: true));
            _controller.resetLoadState();
          },
        );
      }
      return Container();
    });
  }

  Widget buildItemWidget(
      BuildContext context, UgcStateRequestSuccess state, int pos) {
    var itemData = state.ugcList[pos];
    if(pos % 3 == 0 || pos >= 50) {
      return FollowItemVideo(
        coverUrl: itemData.cover,
        duration: itemData.duration,
        avatarUrl: itemData.author.icon,
        title: itemData.title,
        tag: itemData.tags.take(3).map((e) => "#${e.text}").join(" "),
      );
    } else {
      return SmallItemVideo(
        coverUrl: itemData.cover,
        duration: itemData.duration,
        title: itemData.title,
        tag: itemData.tags.take(3).map((e) => "#${e.text}").join(" "),
      );
    }
  }
}
