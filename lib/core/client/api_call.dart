import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'network_exception.dart';

Future<Either<NetworkException, T>> apiCall<T>({
  required Future<dynamic> func,
  required T Function(dynamic) mapper,
}) async {
  try {
    final result = await func;
    return Right(mapper(result));
  } catch (e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.badResponse:
          final err = NetworkException.handleBadResponse(e.response);
          Logger().e(err.toString());
          return Left(err);
        case DioExceptionType.connectionTimeout:
          return Left(ConnectionTimeOutException());
        case DioExceptionType.sendTimeout:
          return Left(SendTimeOutException());
        case DioExceptionType.receiveTimeout:
          return Left(ReceiveTimeOutException());
        case DioExceptionType.cancel:
          return Left(RequestCancelled());
        case DioExceptionType.badCertificate:
          return Left(BadCertificate());
        default:
          return Left(FetchDataException());
      }
    }
    if (e is FormatException) {
      Logger().e('Error: Format from front end error');
    } else if (e is SocketException) {
      Logger().e('Error: No Internet Connection');
    }
    return Left(GeneralException(message: e.toString()));
  }
}
