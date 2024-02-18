import '../../../domain/model/user.dart';
import '../responses/user_response.dart';

class ProfileMapper {
  static User mapResponseToDomain(UserResponse response) {
    return User(
      id: response.id,
      username: response.username,
      email: response.email,
      firstName: response.firstName,
      lastName: response.lastName,
      gender: response.gender,
      image: response.image,
    );
  }
}
