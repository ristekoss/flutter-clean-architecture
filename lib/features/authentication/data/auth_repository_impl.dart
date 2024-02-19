import 'package:boilerplate/core/client/api_call.dart';
import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/authentication/data/local/auth_local_data_sources.dart';
import 'package:boilerplate/features/authentication/data/model/mapper/auth_mapper.dart';
import 'package:boilerplate/features/authentication/data/model/request/post_login_request.dart';
import 'package:boilerplate/features/authentication/data/model/request/save_token_request.dart';
import 'package:boilerplate/features/authentication/data/remote/auth_remote_data_sources.dart';
import 'package:boilerplate/features/authentication/domain/model/auth.dart';
import 'package:boilerplate/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources _remoteDataSources;
  final AuthLocalDataSources _localDataSources;

  const AuthRepositoryImpl(
    this._remoteDataSources,
    this._localDataSources,
  );

  @override
  Future<Either<NetworkException, Auth>> postLogin(
    String username,
    String password,
  ) async {
    final request = PostLoginRequest(username: username, password: password);
    return apiCall<Auth>(
      func: _remoteDataSources.postLogin(request),
      mapper: (value) => AuthMapper.mapResponseToDomain(value),
    );
  }

  @override
  Future<Either<Exception, void>> saveToken(
      String accessToken, String refreshToken) async {
    try {
      final request = SaveTokenRequest(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
      await _localDataSources.saveToken(request);
      return const Right(null);
    } catch (e) {
      return Left(e as Exception);
    }
  }
}
