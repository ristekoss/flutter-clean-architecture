import '../../domain/models/user.dart';
import 'list_user_response.dart';

class MainResponseMapper {

  List<User> toUsers(List<UserResponse> value) => value.map((e) => User(
    id: e.id ?? 0,
    name: "${e.firstName ?? ""} ${e.lastName ?? ""}",
    email: e.email ?? "",
    imageUrl: e.avatar ?? "",
  )).toList();


}