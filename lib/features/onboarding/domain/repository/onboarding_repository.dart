import 'package:boilerplate/core/client/network_exception.dart';
import 'package:dartz/dartz.dart';
import '../model/auth.dart';

abstract class OnboardingRepository {
  Future<Either<NetworkException, OnboardingUser>> getUser();
}
