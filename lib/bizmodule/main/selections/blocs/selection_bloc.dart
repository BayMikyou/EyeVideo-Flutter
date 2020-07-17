import 'package:eye_video/bizmodule/main/selections/blocs/selection_event.dart';
import 'package:eye_video/bizmodule/main/selections/blocs/selection_state.dart';
import 'package:eye_video/bizmodule/main/selections/model/selection_model.dart';
import 'package:eye_video/bizmodule/main/selections/respositories/selection_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:eye_video/bizmodule/main/selections/extension/ext_selection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  final SelectionRepository selectionRepository;
  List<Selection> mSelections = [];
  String nextPageUrl;

  SelectionBloc({@required this.selectionRepository}) : super(null) {
    add(EventRequest(isFirst: true, isRefresh: true));
  }

  @override
  Stream<SelectionState> mapEventToState(SelectionEvent event) async* {
    if (event is EventRequest) {
      if (event.isFirst) {
        yield StateRequestLoading();
      }
      try {
        if (event.isRefresh) {
          //刷新
          mSelections.clear();
          var selectionModel = await selectionRepository.fetchSelections();
          nextPageUrl = selectionModel.nextPageUrl ?? "";
          mSelections.addAll(selectionModel.selectionList);
          if (mSelections.isNotEmpty &&
              mSelections.first.isSquareCard) {
            var selectionFirst = mSelections.first;
            mSelections.add(
              Selection(
                'textCard',
                SelectionData(
                  'TextCard',
                  null,
                  null,
                  null,
                  null,
                  null,
                  'header5',
                  selectionFirst.data.header.title,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                ),
                null,
                0,
                0,
              ),
            );
            mSelections.addAll(selectionFirst.data.selectionList);
          }
        } else {
          //加载更多
          if (_hasNextPage(nextPageUrl)) {
            var selectionModel = await selectionRepository.fetchSelections(
                nextPageUrl: nextPageUrl);
            nextPageUrl = selectionModel.nextPageUrl ?? "";
            mSelections.addAll(selectionModel.selectionList);
          }
        }

        if (mSelections.isEmpty) {
          yield StateRequestEmpty();
        } else {
          yield StateRequestSuccess(
              List.of(mSelections), _hasNextPage(nextPageUrl));
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
      if (uri.queryParameters['isTag'] == 'false' &&
          uri.queryParameters['page'] == '0') {
        return false;
      }
    } catch (e) {
      return false;
    }
    return true;
  }
}
