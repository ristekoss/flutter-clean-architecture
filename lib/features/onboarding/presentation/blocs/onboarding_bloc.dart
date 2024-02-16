import 'package:boilerplate/features/onboarding/presentation/blocs/events/init_onboarding_event.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/onboarding_events.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/onboarding_states.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/states/init_onboarding_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingStates> {
  OnboardingBloc() : super(InitOnboardingLoadingState()) {
    on<GetLocalDataEvent>(_onGetLocalDataEvent);
  }

  Future _onGetLocalDataEvent(
      GetLocalDataEvent event, Emitter<OnboardingStates> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(InitOnboardingSuccessState());
  }
}
