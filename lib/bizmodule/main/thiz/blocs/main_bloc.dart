import 'package:eye_video/bizmodule/main/thiz/blocs/main_event.dart';
import 'package:eye_video/bizmodule/main/thiz/blocs/main_state.dart';
import 'package:eye_video/bizmodule/main/thiz/repositories/main_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository mainRepository;

  MainBloc({this.mainRepository}) : super(null) {
    add(DrawerRequestEvent());
  }

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is DrawerRequestEvent) {
      try {
        var userModel = await mainRepository.fetchUserInfo();
        var drawerConfigsModel = await mainRepository.fetchDrawerConfigs();
        if (drawerConfigsModel.configs.isEmpty &&
            drawerConfigsModel.extendConfigs.isEmpty &&
            userModel == null) {
          yield DrawerLoadedEmptyState();
        }
        yield DrawerLoadedState(
            userModel: userModel, configsModel: drawerConfigsModel);
      } catch (e) {
        yield DrawerLoadedErrorState();
      }
    }
  }
}
