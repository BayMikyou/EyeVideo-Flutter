import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class DrawerRequestEvent extends MainEvent {
  const DrawerRequestEvent();

  @override
  List<Object> get props => [];
}
