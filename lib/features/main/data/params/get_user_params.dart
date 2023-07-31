class GetUserParams {
  final int pageKey;
  final int pageSize;

  const GetUserParams({required this.pageKey, this.pageSize = 10});

  Map<String, dynamic> toJson() {
    return {'page': pageKey, 'per_page': pageSize};
  }
}
