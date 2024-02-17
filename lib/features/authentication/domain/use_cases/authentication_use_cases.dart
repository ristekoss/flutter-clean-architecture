import 'package:dartz/dartz.dart';

import '../../../../core/client/network_exception.dart';
import '../../data/model/request/post_login_request.dart';
import '../model/auth.dart';

abstract class AuthenticationUseCases {
  Future<Either<NetworkException, Auth>> postLogin(String username, String password);
}