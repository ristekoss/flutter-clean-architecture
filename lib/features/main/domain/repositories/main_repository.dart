import 'package:dartz/dartz.dart';
import 'package:boilerplate/features/main/data/params/get_user_params.dart';

import '../../../../core/client/network_exception.dart';
import '../models/user.dart';

abstract class MainRepository {
  Future<Either<NetworkException, List<User>>> getUsers(GetUserParams params);
}