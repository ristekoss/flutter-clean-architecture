import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/features/onboarding/data/onboarding_repository_impl.dart';
import 'package:boilerplate/features/onboarding/data/remote/onboarding_remote_data_sources.dart';
import 'package:boilerplate/features/onboarding/domain/authentication_interactor.dart';
import 'package:boilerplate/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:boilerplate/features/onboarding/domain/use_cases/onboarding_use_cases.dart';
import 'package:boilerplate/features/onboarding/presentation/blocs/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';

void registerOnboarding(GetIt di) {
  di.registerFactory<OnboardingRemoteDataSources>(
      () => OnboardingRemoteDataSourceImpl(di<NetworkService>()));
  di.registerFactory<OnboardingRepository>(
      () => OnboardingRepositoryImpl(di<OnboardingRemoteDataSources>()));
  di.registerFactory<OnboardingUseCases>(
      () => OnboardingInteractor(di<OnboardingRepository>()));
  di.registerLazySingleton<OnboardingBloc>(
      () => OnboardingBloc(di<OnboardingUseCases>()));
}
