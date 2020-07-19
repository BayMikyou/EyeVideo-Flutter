import 'package:equatable/equatable.dart';
import 'package:eye_video/bizmodule/main/thiz/model/drawer_configs.dart';
import 'package:eye_video/bizmodule/main/thiz/model/user_model.dart';
import 'package:flutter/cupertino.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class DrawerLoadedState extends MainState {
  final UserModel userModel;
  final DrawerConfigsModel configsModel;

  DrawerLoadedState({@required this.userModel, @required this.configsModel});

  @override
  List<Object> get props => [this.userModel, configsModel];
}

class DrawerLoadedErrorState extends MainState {}

class DrawerLoadedEmptyState extends MainState {}
