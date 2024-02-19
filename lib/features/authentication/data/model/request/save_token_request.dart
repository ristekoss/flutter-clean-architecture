class SaveTokenRequest {
  final String accessToken;
  final String refreshToken;

  const SaveTokenRequest({
    required this.accessToken,
    required this.refreshToken,
  });
}
