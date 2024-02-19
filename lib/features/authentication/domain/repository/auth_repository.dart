import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/authentication/domain/model/auth.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<NetworkException, Auth>> postLogin(
    String username,
    String password,
  );

  Future<Either<Exception, void>> saveToken(
    String accessToken,
    String refreshToken,
  );
}
