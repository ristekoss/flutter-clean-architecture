import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/core/constants/endpoints.dart';
import 'package:boilerplate/features/main/data/params/get_user_params.dart';
import 'package:boilerplate/features/main/data/responses/mapper.dart';

import '../../domain/models/user.dart';
import '../responses/list_user_response.dart';

abstract class MainRemoteDataSources {
  Future<List<User>> getUsers(GetUserParams params);
}

class MainRemoteDataSourceImpl implements MainRemoteDataSources {
  final NetworkService networkService;
  const MainRemoteDataSourceImpl(this.networkService);

  @override
  Future<List<User>> getUsers(GetUserParams params) async {
    const url = Endpoints.getUser;
    final response = await networkService.get(url, queryParams: params.toJson());
    final userList = ListUserResponse.fromJson(response.data).data ?? [];
    return MainResponseMapper().toUsers(userList);
  }

}