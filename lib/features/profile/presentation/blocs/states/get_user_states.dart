import 'package:boilerplate/features/profile/domain/model/user.dart';

import '../profile_states.dart';

class GetUserInitState extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class GetUserLoadingState extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class GetUserSuccessState extends ProfileStates {
  final User user;

  GetUserSuccessState({required this.user});

  @override
  List<Object?> get props => [user];
}

class GetUserErrorState extends ProfileStates {
  final String message;

  GetUserErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
