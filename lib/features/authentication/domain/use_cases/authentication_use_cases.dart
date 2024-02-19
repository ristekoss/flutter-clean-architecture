import 'package:dartz/dartz.dart';

import '../../../../core/client/network_exception.dart';
import '../model/auth.dart';

abstract class AuthenticationUseCases {
  Future<Either<NetworkException, Auth>> postLogin(
    String username,
    String password,
  );

  Future<Either<Exception, void>> saveToken(
    String accessToken,
    String refreshToken,
  );
}
