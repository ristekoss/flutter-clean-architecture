import 'package:boilerplate/core/client/network_exception.dart';
import 'package:boilerplate/features/onboarding/data/model/mapper/onboarding_mapper.dart';
import 'package:boilerplate/features/onboarding/data/remote/onboarding_remote_data_sources.dart';
import 'package:boilerplate/features/onboarding/domain/model/onboarding_user.dart';
import 'package:dartz/dartz.dart';

import '../../../core/client/api_call.dart';
import '../domain/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSources _dataSources;

  const OnboardingRepositoryImpl(this._dataSources);

  @override
  Future<Either<NetworkException, OnboardingUser>> getUser() {
    return apiCall<OnboardingUser>(
      func: _dataSources.getUser(),
      mapper: (value) => OnboardingMapper.mapResponseToDomain(value),
    );
  }
}
