import 'package:dartz/dartz.dart';

import '../../../../core/client/network_exception.dart';
import '../model/user.dart';

abstract class ProfileUseCases {
  Future<Either<NetworkException, User>> getUser();
  Future<Either<NetworkException, void>> logOut();
}
