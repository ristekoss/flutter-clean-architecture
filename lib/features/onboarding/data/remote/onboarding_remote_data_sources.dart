import 'package:boilerplate/core/client/network_service.dart';
import 'package:boilerplate/core/constants/endpoints.dart';

import '../model/responses/onboarding_response.dart';

abstract class OnboardingRemoteDataSources {
  Future<OnboardingResponse> getUser();
}

class OnboardingRemoteDataSourceImpl implements OnboardingRemoteDataSources {
  final NetworkService networkService;

  const OnboardingRemoteDataSourceImpl(this.networkService);

  @override
  Future<OnboardingResponse> getUser() async {
    const url = Endpoints.getUser;
    final response = await networkService.get(url);
    return OnboardingResponse.fromJson(response.data);
  }
}
