import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/authentication/domain/model/auth.dart';
import 'package:boilerplate/features/authentication/domain/repository/auth_repository.dart';
import 'package:boilerplate/features/authentication/domain/use_cases/authentication_use_cases.dart';
import 'package:dartz/dartz.dart';

class AuthenticationInteractor implements AuthenticationUseCases {
  final AuthRepository _repository;

  const AuthenticationInteractor(this._repository);

  @override
  Future<Either<NetworkException, Auth>> postLogin(
    String username,
    String password,
  ) {
    return _repository.postLogin(username, password);
  }

  @override
  Future<Either<Exception, void>> saveToken(
      String accessToken, String refreshToken) {
    return _repository.saveToken(
      accessToken,
      refreshToken,
    );
  }
}
