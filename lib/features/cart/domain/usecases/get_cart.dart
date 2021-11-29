import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/core/usecases/usecase.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobile_shop/features/cart/domain/repositories/cart_repository.dart';

class GetCart extends UseCase<CartEntity> {
  final CartRepository cartRepository;

  GetCart(this.cartRepository);

  @override
  Future<Either<Failure, CartEntity>> call() async {
    return await cartRepository.getCart();
  }
}
