import 'package:eye_video/bizmodule/main/selections/blocs/ugc/ugc_event.dart';
import 'package:eye_video/bizmodule/main/selections/blocs/ugc/ugc_state.dart';
import 'package:eye_video/bizmodule/main/selections/model/ugc/ugc_model.dart';
import 'package:eye_video/bizmodule/main/selections/respositories/ugc_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UgcBloc extends Bloc<UgcEvent, UgcState> {
  final UgcRepository ugcRepository;
  List<UgcModel> mUgcList = [];
  int currPage = 1;
  int totalCount = 0;

  UgcBloc({@required this.ugcRepository}) : super(null) {
    add(UgcEventRequest(isFirst: true, isRefresh: true));
  }

  @override
  Stream<UgcState> mapEventToState(UgcEvent event) async* {
    try {
      if (event is UgcEventRequest) {
        if (event.isFirst) {
          yield UgcStateRequestLoading();
        }

        if (event.isRefresh) {
          mUgcList.clear();
          currPage = 1;
          var ugcListModel = await ugcRepository.fetchUgcList(page: currPage, pageSize: 20);
          totalCount = ugcListModel.totalCount;
          mUgcList.addAll(ugcListModel.list);
        } else {
          if (_hasNextPage) {
            var ugcListModel = await ugcRepository.fetchUgcList(
                page: ++currPage, pageSize: 20);
            totalCount = ugcListModel.totalCount;
            mUgcList.addAll(ugcListModel.list);
          }
        }
        if (mUgcList.isEmpty) {
          yield UgcStateRequestEmpty();
        } else {
          yield UgcStateRequestSuccess(List.of(mUgcList), _hasNextPage);
        }
      }
    } catch (e) {
      yield UgcStateRequestFailure();
    }
  }

  bool get _hasNextPage => totalCount > mUgcList.length;
}
