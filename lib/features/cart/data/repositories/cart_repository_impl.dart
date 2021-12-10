import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/error/exception.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:mobile_shop/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:mobile_shop/features/cart/data/models/cart_model.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobile_shop/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;
  final CartLocalDataSource cartLocalDataSource;
  bool gotDataFromRemote = false;
  CartRepositoryImpl(
      {required this.cartLocalDataSource, required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, CartEntity>> getCart() {
    log('get cart , got data = $gotDataFromRemote');
    return _getCart(() => gotDataFromRemote
        ? cartLocalDataSource.getCart()
        : cartRemoteDataSource.getCart());
  }

  Future<Either<Failure, CartModel>> _getCart(
      Future<CartModel> Function() getFunction) async {
    try {
      final source = await getFunction();
      if (!gotDataFromRemote) {
        cartLocalDataSource.storeCart(source);
        gotDataFromRemote = true;
      }
      return Right(source);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
