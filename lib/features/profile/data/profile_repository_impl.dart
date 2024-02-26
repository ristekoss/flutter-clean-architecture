import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/profile/data/local/profile_local_data_sources.dart';
import 'package:boilerplate/features/profile/data/remote/profile_remote_data_sources.dart';
import 'package:dartz/dartz.dart';

import '../../../core/client/api_call.dart';
import '../domain/model/user.dart';
import '../domain/repository/profile_repository.dart';
import 'model/mapper/profile_mapper.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSources _remoteDataSources;
  final ProfileLocalDataSources _localDataSources;

  const ProfileRepositoryImpl(this._remoteDataSources, this._localDataSources);

  @override
  Future<Either<NetworkException, User>> getUser() {
    return apiCall<User>(
      func: _remoteDataSources.getUser(),
      mapper: (value) => ProfileMapper.mapResponseToDomain(value),
    );
  }

  @override
  Future<Either<NetworkException, void>> logOut() {
    return apiCall<void>(
      func: _localDataSources.logOut(),
      mapper: (value) {},
    );
  }
}
