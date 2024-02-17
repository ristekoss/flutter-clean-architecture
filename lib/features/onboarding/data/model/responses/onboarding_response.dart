import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_response.freezed.dart';
part 'onboarding_response.g.dart';

@freezed
class OnboardingResponse with _$OnboardingResponse {
  const factory OnboardingResponse({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String image,
  }) = _OnboardingResponse;

  factory OnboardingResponse.fromJson(Map<String, dynamic> json) =>
      _$OnboardingResponseFromJson(json);
}