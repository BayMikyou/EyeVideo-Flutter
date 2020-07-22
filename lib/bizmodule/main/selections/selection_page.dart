import 'package:eye_video/bizmodule/main/selections/blocs/selection_bloc.dart';
import 'package:eye_video/bizmodule/main/selections/blocs/selection_event.dart';
import 'package:eye_video/bizmodule/main/selections/blocs/selection_state.dart';
import 'package:eye_video/bizmodule/main/selections/extension/ext_selection.dart';
import 'package:eye_video/bizmodule/main/selections/widgets/follow_Item.dart';
import 'package:eye_video/bizmodule/main/selections/widgets/header_item.dart';
import 'package:eye_video/bizmodule/main/selections/widgets/small_video_item.dart';
import 'package:eye_video/framework/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class SelectionPage extends StatelessWidget {
  final EasyRefreshController _controller = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionBloc, SelectionState>(
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
        return EasyRefresh(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          enableControlFinishLoad: false,
          enableControlFinishRefresh: false,
          controller: _controller,
          child: ListView.builder(
            itemCount: state.selections.length,
            itemBuilder: (BuildContext context, int pos) {
              return buildItemWidget(context, state, pos);
            },
          ),
          onLoad: () async {
            if (!state.hasNextPage) {
              _controller.finishLoad(noMore: true);
              context.showSnackBar(msg: '已经到底了～');
            } else {
              BlocProvider.of<SelectionBloc>(context).add(EventRequest(isFirst: false, isRefresh: false));
            }
          },
          onRefresh: () async {
            BlocProvider.of<SelectionBloc>(context).add(EventRequest(isFirst: false, isRefresh: true));
            _controller.resetLoadState();
          },
        );
      }
      return Container();
    });
  }

  Widget buildItemWidget(
      BuildContext context, StateRequestSuccess state, int pos) {
    var itemData = state.selections[pos];
    if (itemData.isFollowCard) {
      return FollowItemVideo(
        coverUrl: itemData.data.content.data.cover.detail,
        duration: itemData.data.content.data.duration,
        avatarUrl: itemData.data.header.icon,
        title: itemData.data.header.title,
        tag: itemData.data.content.data.tags
                .take(3)
                .map((e) => "#${e.name}")
                .join(" ") ??
            '#精选推荐',
      );
    } else if (itemData.isSmallVideoCard) {
      return SmallItemVideo(
        title: itemData.data.title,
        tag: itemData.data.tags.take(2).map((e) => "#${e.name}").join(" "),
        coverUrl: itemData.data.cover.detail,
        duration: itemData.data.duration,
      );
    } else if (itemData.isHeaderCard) {
      return HeaderItem(
        title: itemData.data.text,
      );
    } else {
      return Container();
    }
  }
}
