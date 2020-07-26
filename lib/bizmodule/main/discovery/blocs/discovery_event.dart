import 'package:equatable/equatable.dart';

abstract class DiscoveryEvent extends Equatable {
  const DiscoveryEvent();

  @override
  List<Object> get props => [];
}

class DiscoveryRequestEvent extends DiscoveryEvent {
  const DiscoveryRequestEvent();

  @override
  List<Object> get props => [];
}
