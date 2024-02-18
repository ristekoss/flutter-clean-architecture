import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/profile/data/remote/profile_remote_data_sources.dart';
import 'package:dartz/dartz.dart';

import '../../../core/client/api_call.dart';
import '../domain/model/user.dart';
import '../domain/repository/profile_repository.dart';
import 'model/mapper/profile_mapper.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSources _dataSources;

  const ProfileRepositoryImpl(this._dataSources);

  @override
  Future<Either<NetworkException, User>> getUser() {
    return apiCall<User>(
      func: _dataSources.getUser(),
      mapper: (value) => ProfileMapper.mapResponseToDomain(value),
    );
  }
}
