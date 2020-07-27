import 'package:equatable/equatable.dart';
import 'package:eye_video/bizmodule/main/community/model/community_model.dart';

abstract class CommunityState extends Equatable {
  @override
  List<Object> get props => [];

  const CommunityState();
}

class StateRequestSuccess extends CommunityState {
  final List<Community> communityList;

  final bool hasNextPage;

  const StateRequestSuccess(this.communityList, this.hasNextPage);

  List<Object> get props => [communityList, hasNextPage];
}

class StateRequestLoading extends CommunityState {
  List<Object> get props => [];
}

class StateRequestFailure extends CommunityState {
  List<Object> get props => [];
}

class StateRequestEmpty extends CommunityState {
  List<Object> get props => [];
}
