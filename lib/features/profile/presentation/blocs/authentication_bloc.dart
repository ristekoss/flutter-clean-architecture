import 'package:boilerplate/features/profile/presentation/blocs/states/get_user_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/profile_use_cases.dart';
import 'events/get_user_event.dart';
import 'events/log_out_event.dart';
import 'profile_events.dart';
import 'profile_states.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  final ProfileUseCases _useCases;

  ProfileBloc(this._useCases) : super(GetUserInitState()) {
    on<GetUserEvent>(_onGetUserEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }

  Future _onGetUserEvent(
      GetUserEvent event, Emitter<ProfileStates> emitter) async {
    emitter(GetUserInitState());
    final response = await _useCases.getUser();
    await response.fold(
      (l) {
        emitter(
          GetUserErrorState(message: l.message ?? ''),
        );
      },
      (r) async {
        emitter(GetUserSuccessState(user: r));
      },
    );
  }

  Future _onLogOutEvent(
    LogOutEvent event,
    Emitter<ProfileStates> emitter,
  ) async {
    await _useCases.logOut();
  }
}
