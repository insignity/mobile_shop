import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/error/exception.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobile_shop/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, CartEntity>> getCart() {
    return _getCart(() => cartRemoteDataSource.getCart());
  }

  Future<Either<Failure, CartEntity>> _getCart(
      Future<CartEntity> Function() getCategorys) async {
    try {
      final remoteCategory = await getCategorys();
      return Right(remoteCategory);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
