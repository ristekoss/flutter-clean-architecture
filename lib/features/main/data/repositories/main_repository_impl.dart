import 'package:dartz/dartz.dart';
import 'package:boilerplate/core/client/api_call.dart';
import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/main/data/data_sources/main_remote_data_sources.dart';
import 'package:boilerplate/features/main/data/params/get_user_params.dart';
import 'package:boilerplate/features/main/domain/models/user.dart';
import 'package:boilerplate/features/main/domain/repositories/main_repository.dart';

class MainRepositoryImpl implements MainRepository {
  final MainRemoteDataSources _dataSources;
  const MainRepositoryImpl(this._dataSources);


  @override
  Future<Either<NetworkException, List<User>>> getUsers(GetUserParams params) {
    return apiCall(_dataSources.getUsers(params));
  }

}