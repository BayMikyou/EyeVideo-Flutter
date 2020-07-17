import 'package:equatable/equatable.dart';
import 'package:eye_video/bizmodule/main/selections/model/selection_model.dart';

abstract class SelectionState extends Equatable {
  @override
  List<Object> get props => [];

  const SelectionState();
}

class StateRequestSuccess extends SelectionState {
  final List<Selection> selections;

  final bool hasNextPage;

  const StateRequestSuccess(this.selections, this.hasNextPage);

  List<Object> get props => [selections, hasNextPage];
}

class StateRequestLoading extends SelectionState {
  List<Object> get props => [];
}

class StateRequestFailure extends SelectionState {
  List<Object> get props => [];
}

class StateRequestEmpty extends SelectionState {
  List<Object> get props => [];
}