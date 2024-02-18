import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/core/constants/endpoints.dart';

import '../model/responses/user_response.dart';

abstract class ProfileRemoteDataSources {
  Future<UserResponse> getUser();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSources {
  final NetworkService networkService;

  const ProfileRemoteDataSourceImpl(this.networkService);

  @override
  Future<UserResponse> getUser() async {
    const url = Endpoints.getUser;
    final response = await networkService.get(url);
    return UserResponse.fromJson(response.data);
  }
}
