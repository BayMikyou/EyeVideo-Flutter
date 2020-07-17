import 'package:equatable/equatable.dart';

abstract class SelectionEvent extends Equatable {
  @override
  List<Object> get props => [];

  const SelectionEvent();
}

class EventRequest extends SelectionEvent {
  @override
  List<Object> get props => [isFirst];

  final bool isFirst;

  final bool isRefresh;

  const EventRequest({this.isFirst: true, this.isRefresh: true});
}