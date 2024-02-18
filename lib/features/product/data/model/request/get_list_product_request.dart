class GetListProductRequest {
  final int skip;
  final int limit;

  const GetListProductRequest({
    this.limit = 30,
    this.skip = 0,
  });

  Map<String, dynamic> toJson() => {'skip': skip, 'limit': limit};
}
