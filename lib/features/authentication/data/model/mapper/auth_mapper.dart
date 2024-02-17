import 'package:boilerplate/features/authentication/domain/model/auth.dart';

import '../responses/auth_response.dart';

class AuthMapper {
  static Auth mapResponseToDomain(AuthResponse response) {
    return Auth(
      id: response.id,
      username: response.username,
      email: response.email,
      firstName: response.firstName,
      lastName: response.lastName,
      gender: response.gender,
      image: response.image,
      token: response.token,
    );
  }
}
