import 'package:boilerplate/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';

void registerOnboarding(GetIt di) {
  di.registerLazySingleton<OnboardingBloc>(() => OnboardingBloc());
}