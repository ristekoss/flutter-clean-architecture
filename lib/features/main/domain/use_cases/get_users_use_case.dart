import 'package:dartz/dartz.dart';
import 'package:boilerplate/core/bases/use_case.dart';
import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/main/data/params/get_user_params.dart';
import 'package:boilerplate/features/main/domain/repositories/main_repository.dart';

import '../models/user.dart';

class GetUserUseCase implements UseCase<List<User>, GetUserParams> {
  final MainRepository _repository;
  GetUserUseCase(this._repository);

  @override
  Future<Either<NetworkException, List<User>?>> execute([GetUserParams? args]) {
    if (args == null) throw Exception('Arguments required');
    return _repository.getUsers(args);
  }
}