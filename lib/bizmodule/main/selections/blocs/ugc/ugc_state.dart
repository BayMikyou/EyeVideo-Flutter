import 'package:equatable/equatable.dart';
import 'package:eye_video/bizmodule/main/selections/model/ugc/ugc_model.dart';

abstract class UgcState extends Equatable {
  @override
  List<Object> get props => [];

  const UgcState();
}

class UgcStateRequestSuccess extends UgcState {
  final List<UgcModel> ugcList;
  final bool hasNextPage;

  const UgcStateRequestSuccess(this.ugcList, this.hasNextPage);

  List<Object> get props => [ugcList, hasNextPage];
}

class UgcStateRequestLoading extends UgcState {
  List<Object> get props => [];
}

class UgcStateRequestFailure extends UgcState {
  List<Object> get props => [];
}

class UgcStateRequestEmpty extends UgcState {
  List<Object> get props => [];
}
