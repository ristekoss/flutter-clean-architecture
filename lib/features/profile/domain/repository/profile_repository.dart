import 'package:boilerplate/core/client/network_exception.dart';
import 'package:dartz/dartz.dart';
import '../model/user.dart';

abstract class ProfileRepository {
  Future<Either<NetworkException, User>> getUser();
  Future<Either<NetworkException, void>> logOut();
}
