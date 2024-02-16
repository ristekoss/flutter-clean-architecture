class PostLoginParams {
  final String username;
  final String password;

  const PostLoginParams({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
