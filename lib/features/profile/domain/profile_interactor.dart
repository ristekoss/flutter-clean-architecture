import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/profile/domain/repository/profile_repository.dart';
import 'package:boilerplate/features/profile/domain/use_cases/profile_use_cases.dart';
import 'package:dartz/dartz.dart';

import 'model/user.dart';

class ProfileInteractor implements ProfileUseCases {
  final ProfileRepository _repository;

  const ProfileInteractor(this._repository);

  @override
  Future<Either<NetworkException, User>> getUser() {
    return _repository.getUser();
  }

  @override
  Future<Either<NetworkException, void>> logOut() {
    return _repository.logOut();
  }
}
