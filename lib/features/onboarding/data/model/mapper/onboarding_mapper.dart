import '../../../domain/model/onboarding_user.dart';
import '../responses/onboarding_response.dart';

class OnboardingMapper {
  static OnboardingUser mapResponseToDomain(OnboardingResponse response) {
    return OnboardingUser(
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
