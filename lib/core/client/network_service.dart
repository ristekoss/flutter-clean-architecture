import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

enum NetworkServiceType {
  production,
  staging,
}

final interceptors = QueuedInterceptorsWrapper(onRequest: (options, handler) {
  if (kDebugMode) {
    Logger().i({
      'api': options.path,
      'headers': options.headers,
      'queryParams': options.queryParameters,
    });
  }
  return handler.next(options);
}, onResponse: (resp, handler) {
  if (kDebugMode) {
    final isBytes = resp.requestOptions.responseType == ResponseType.bytes;
    Logger().i({
      'api': '''
${resp.statusCode}: ${resp.requestOptions.baseUrl}${resp.requestOptions.path}''',
      'headers': resp.requestOptions.headers,
      'queryParams': resp.requestOptions.queryParameters,
      'body': resp.requestOptions.data,
      'response': isBytes ? 'bytes' : resp.data,
    });
  }
  return handler.next(resp);
}, onError: (err, handler) {
  if (kDebugMode) {
    Logger().e({
      'api': '''
${err.response?.statusCode ?? 0}: ${err.requestOptions.baseUrl}${err.requestOptions.path}''',
      'headers': err.requestOptions.headers,
      'queryParams': err.requestOptions.queryParameters,
      'body': err.requestOptions.data,
      'response': err.response?.data,
      'type': err.type
    });
  }
  return handler.next(err);
});

final options = Options(
  receiveTimeout: const Duration(milliseconds: 5000),
  sendTimeout: const Duration(milliseconds: 6000),
);

const Duration globalTimeout = Duration(seconds: 15);

class NetworkService {
  final String baseUrl;
  final NetworkServiceType type;

  NetworkService(
      {required this.baseUrl, this.type = NetworkServiceType.staging});

  final dio = Dio()..interceptors.add(interceptors);

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    final Map<String, String> defaultHeaders = {'Authorization': ''};

    /// If a key of [other] is already in this map, its value is overwritten.
    headers?.addAll(defaultHeaders);

    Response response = await dio.get(baseUrl + path,
        queryParameters: queryParams,
        options: options.copyWith(
          headers: headers ?? defaultHeaders,
        )).timeout(globalTimeout);
    return response;
  }

  Future<Response> post(
      String path, {
        Map<String, dynamic>? queryParams,
        Map<String, String>? headers,
        Map<String, dynamic>? data,
      }) async {
    final Map<String, String> defaultHeaders = {'Authorization': ''};

    /// If a key of [other] is already in this map, its value is overwritten.
    headers?.addAll(defaultHeaders);

    Response response = await dio.post(baseUrl + path,
        queryParameters: queryParams,
        data: json.encode(data),
        options: options.copyWith(
          headers: headers ?? defaultHeaders,
        )).timeout(globalTimeout);
    return response;
  }

  Future<Response> put(
      String path, {
        Map<String, dynamic>? queryParams,
        Map<String, String>? headers,
        Map<String, dynamic>? data,
      }) async {
    final Map<String, String> defaultHeaders = {'Authorization': ''};

    /// If a key of [other] is already in this map, its value is overwritten.
    headers?.addAll(defaultHeaders);

    Response response = await dio.put(baseUrl + path,
        queryParameters: queryParams,
        data: json.encode(data),
        options: options.copyWith(
          headers: headers ?? defaultHeaders,
        )).timeout(globalTimeout);
    return response;
  }

  Future<Response> delete(
      String path, {
        Map<String, dynamic>? queryParams,
        Map<String, String>? headers,
        Map<String, dynamic>? data,
      }) async {
    final Map<String, String> defaultHeaders = {'Authorization': ''};

    /// If a key of [other] is already in this map, its value is overwritten.
    headers?.addAll(defaultHeaders);

    Response response = await dio.delete(baseUrl + path,
        queryParameters: queryParams,
        data: json.encode(data),
        options: options.copyWith(
          headers: headers ?? defaultHeaders,
        )).timeout(globalTimeout);
    return response;
  }

  Future<Response> patch(
      String path, {
        Map<String, dynamic>? queryParams,
        Map<String, String>? headers,
        Map<String, dynamic>? data,
      }) async {
    final Map<String, String> defaultHeaders = {'Authorization': ''};

    /// If a key of [other] is already in this map, its value is overwritten.
    headers?.addAll(defaultHeaders);

    Response response = await dio.patch(baseUrl + path,
        queryParameters: queryParams,
        data: json.encode(data),
        options: options.copyWith(
          headers: headers ?? defaultHeaders,
        )).timeout(globalTimeout);
    return response;
  }
}
