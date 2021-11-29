import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>> getCart();
}
