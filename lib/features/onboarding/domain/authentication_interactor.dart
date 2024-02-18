import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/onboarding/domain/model/onboarding_user.dart';
import 'package:boilerplate/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:boilerplate/features/onboarding/domain/use_cases/onboarding_use_cases.dart';
import 'package:dartz/dartz.dart';

class OnboardingInteractor implements OnboardingUseCases {
  final OnboardingRepository _repository;

  const OnboardingInteractor(this._repository);

  @override
  Future<Either<NetworkException, OnboardingUser>> getUser() {
    return _repository.getUser();
  }
}
