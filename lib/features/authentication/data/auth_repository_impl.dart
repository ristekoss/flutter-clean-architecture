import 'package:boilerplate/core/client/api_call.dart';
import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/authentication/data/model/mapper/auth_mapper.dart';
import 'package:boilerplate/features/authentication/data/model/request/post_login_request.dart';
import 'package:boilerplate/features/authentication/data/remote/auth_remote_data_sources.dart';
import 'package:boilerplate/features/authentication/domain/model/auth.dart';
import 'package:boilerplate/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources _dataSources;

  const AuthRepositoryImpl(this._dataSources);

  @override
  Future<Either<NetworkException, Auth>> postLogin(
    String username,
    String password,
  ) async {
    final request = PostLoginRequest(username: username, password: password);
    return _dataSources.postLogin(request).then(
          (value) => apiCall<Auth>(
            AuthMapper.mapResponseToDomain(value),
          ),
        );
  }
}
