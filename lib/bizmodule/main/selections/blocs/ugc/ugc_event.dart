import 'package:equatable/equatable.dart';

abstract class UgcEvent extends Equatable {
  @override
  List<Object> get props => [];

  const UgcEvent();
}

class UgcEventRequest extends UgcEvent {
  @override
  List<Object> get props => [isFirst];

  final bool isFirst;

  final bool isRefresh;

  const UgcEventRequest({this.isFirst: true, this.isRefresh: true});
}
