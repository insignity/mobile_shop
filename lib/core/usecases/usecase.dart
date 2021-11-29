import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/error/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
