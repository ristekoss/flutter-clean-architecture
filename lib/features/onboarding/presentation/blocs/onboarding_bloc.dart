import 'dart:io';

import 'package:boilerplate/features/onboarding/presentation/blocs/events/get_user_event.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/onboarding_events.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/onboarding_states.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/states/onboarding_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/onboarding_use_cases.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingStates> {
  final OnboardingUseCases _useCases;

  OnboardingBloc(
    this._useCases,
  ) : super(OnboardingLoadingState()) {
    on<GetUserEvent>(_onGetUserEvent);
  }

  Future _onGetUserEvent(
      GetUserEvent event, Emitter<OnboardingStates> emit) async {
    emit(OnboardingLoadingState());

    final response = await _useCases.getUser();
    response.fold(
      (l) {
        if (l is SocketException) {
          emit(OnboardingErrorState());
          return;
        }
        emit(OnboardingNewState());
      },
      (r) {
        emit(OnboardingLoggedState());
      },
    );
  }
}
