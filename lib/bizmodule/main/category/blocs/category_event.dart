import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class EventRequestCategory extends CategoryEvent {
  const EventRequestCategory();

  @override
  List<Object> get props => [];
}
