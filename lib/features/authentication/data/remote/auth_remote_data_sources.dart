import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/core/constants/endpoints.dart';
import 'package:boilerplate/features/authentication/data/remote/responses/auth_response.dart';
import 'package:boilerplate/features/authentication/domain/model/params/auth_params.dart';

abstract class AuthRemoteDataSources {
  Future<AuthResponse> postLogin(PostLoginParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSources {
  final NetworkService networkService;

  const AuthRemoteDataSourceImpl(this.networkService);

  @override
  Future<AuthResponse> postLogin(PostLoginParams params) async {
    const url = Endpoints.login;
    final response = await networkService.post(url, data: params.toJson());
    return AuthResponse.fromJson(response.data);
  }
}
