import 'package:dartz/dartz.dart';

import '../../../../core/client/network_exception.dart';
import '../model/onboarding_user.dart';

abstract class OnboardingUseCases {
  Future<Either<NetworkException, OnboardingUser>> getUser();
}