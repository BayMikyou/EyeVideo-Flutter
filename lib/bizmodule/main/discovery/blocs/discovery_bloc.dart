import 'package:eye_video/bizmodule/main/discovery/blocs/discovery_event.dart';
import 'package:eye_video/bizmodule/main/discovery/blocs/discovery_state.dart';
import 'package:eye_video/bizmodule/main/discovery/respositories/discovery_repository.dart';
import 'package:flutter/material.dart';
import 'package:eye_video/bizmodule/main/discovery/model/discovery_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoveryBloc extends Bloc<DiscoveryEvent, DiscoveryState> {
  final DiscoveryRepository discoveryRepository;

  DiscoveryBloc({@required this.discoveryRepository}) : super(null) {
    add(DiscoveryRequestEvent());
  }

  @override
  Stream<DiscoveryState> mapEventToState(DiscoveryEvent event) async* {
    if (event is DiscoveryRequestEvent) {
      yield StateLoading();
      try {
        final DiscoveryModel discoveryModel =
            await discoveryRepository.fetchDiscovery();
        if (discoveryModel == null || discoveryModel.discoveryList.isEmpty) {
          yield StateEmpty();
        } else {
          yield StateLoadSuccess(discoveryModel: discoveryModel);
        }
      } catch (e) {
        yield StateLoadFailure();
      }
    }
  }
}
