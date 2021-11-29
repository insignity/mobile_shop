import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/error/failure.dart';

abstract class UseCaseParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
