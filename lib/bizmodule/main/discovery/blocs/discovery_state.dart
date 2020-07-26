import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:eye_video/bizmodule/main/discovery/model/discovery_model.dart';

abstract class DiscoveryState extends Equatable {
  const DiscoveryState();

  @override
  List<Object> get props => [];
}

class StateLoadSuccess extends DiscoveryState {
  final DiscoveryModel discoveryModel;

  const StateLoadSuccess({@required this.discoveryModel})
      : assert(discoveryModel != null);

  @override
  List<Object> get props => [discoveryModel];
}

class StateLoadFailure extends DiscoveryState {
  List<Object> get props => [];
}

class StateLoading extends DiscoveryState {
  List<Object> get props => [];
}

class StateEmpty extends DiscoveryState {
  List<Object> get props => [];
}
