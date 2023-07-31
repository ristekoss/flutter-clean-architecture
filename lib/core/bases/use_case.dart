import 'package:dartz/dartz.dart';
import 'package:boilerplate/core/client/network_exception.dart';

abstract class UseCase<T, A> {
  Future<Either<NetworkException, T?>> execute([A args]);
}