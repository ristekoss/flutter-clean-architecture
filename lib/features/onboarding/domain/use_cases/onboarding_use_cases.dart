import 'package:dartz/dartz.dart';

import '../../../../core/client/network_exception.dart';
import '../model/auth.dart';

abstract class OnboardingUseCases {
  Future<Either<NetworkException, OnboardingUser>> getUser();
}