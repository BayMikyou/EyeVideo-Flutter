import 'package:eye_video/bizmodule/main/community/blocs/community_event.dart';
import 'package:eye_video/bizmodule/main/community/blocs/community_state.dart';
import 'package:eye_video/bizmodule/main/community/model/community_model.dart';
import 'package:eye_video/bizmodule/main/community/respositories/community_repository.dart';
import 'package:eye_video/bizmodule/main/community/extension/ext_community.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityRepository communityRepository;
  List<Community> mCommunityList = [];
  String nextPageUrl;

  CommunityBloc({@required this.communityRepository}) : super(null){
    add(EventRequest(isFirst: true, isRefresh: true));
  }

  @override
  Stream<CommunityState> mapEventToState(CommunityEvent event) async* {
    if (event is EventRequest) {
      if (event.isFirst) {
        yield StateRequestLoading();
      }
      try {
        if (event.isRefresh) {
          //刷新
          mCommunityList.clear();
          var communityModel = await communityRepository.fetchCommunity();
          nextPageUrl = communityModel.nextPageUrl ?? "";
          mCommunityList.addAll(communityModel.communityList);
        } else {
          //加载更多
          if (_hasNextPage(nextPageUrl)) {
            var communityModel = await communityRepository.fetchCommunity();
            nextPageUrl = communityModel.nextPageUrl ?? "";
            mCommunityList.addAll(communityModel.communityList.where((element) => !element.isHorizontalScrollCard));
          }
        }

        if (mCommunityList.isEmpty) {
          yield StateRequestEmpty();
        } else {
          yield StateRequestSuccess(List.of(mCommunityList), _hasNextPage(nextPageUrl));
    }
    } catch (e) {
    yield StateRequestFailure();
    }
  }
  }

  bool _hasNextPage(String nextPageUrl) {
    if (nextPageUrl == null || nextPageUrl.isEmpty) {
      return false;
    }
    try {
      Uri uri = Uri.parse(nextPageUrl);
      // ignore: unrelated_type_equality_checks
      if (uri.queryParameters['smallCardLast'] == null && uri.queryParameters['smallCardLast'] == 0 &&
          uri.queryParameters['pageCount'] == '0') {
        return false;
      }
    } catch (e) {
      return false;
    }
    return true;
  }
}
