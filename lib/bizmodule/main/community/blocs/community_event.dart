import 'package:equatable/equatable.dart';

abstract class CommunityEvent extends Equatable {
  @override
  List<Object> get props => [];

  const CommunityEvent();
}

class EventRequest extends CommunityEvent {
  @override
  List<Object> get props => [isFirst];

  final bool isFirst;

  final bool isRefresh;

  const EventRequest({this.isFirst: true, this.isRefresh: true});
}