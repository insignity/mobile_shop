import 'dart:developer';

import 'package:mobile_shop/core/error/exception.dart';
import 'package:mobile_shop/features/home/data/datasources/home_local_data_source.dart';
import 'package:mobile_shop/features/home/data/datasources/home_remote_data_source.dart';
import 'package:mobile_shop/features/home/data/models/best_seller_model.dart';
import 'package:mobile_shop/features/home/data/models/home_store_model.dart';
import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';
import 'package:mobile_shop/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  bool storedBestSellers = false;
  bool storedHomeStores = false;

  HomeRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<BestSellerEntity>>> getBestSellers() {
    log('storedHomeStores = $storedBestSellers');
    return _getBestSellers(() => storedBestSellers
        ? localDataSource.getBestSellers()
        : remoteDataSource.getBestSellers());
  }

  Future<Either<Failure, List<BestSellerEntity>>> _getBestSellers(
      Future<List<BestSellerModel>> Function() getCategorys) async {
    try {
      final source = await getCategorys();
      if (!storedBestSellers) {
        localDataSource.storeBestSellers(source);
        storedBestSellers = true;
      }
      return Right(source);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<HomeStoreEntity>>> getHomeStores() {
    log('storedHomeStores = $storedHomeStores');
    return _getHomeStores(() => storedHomeStores
        ? localDataSource.getHomeStores()
        : remoteDataSource.getHomeStores());
  }

  Future<Either<Failure, List<HomeStoreEntity>>> _getHomeStores(
      Future<List<HomeStoreModel>> Function() getFunction) async {
    try {
      final source = await getFunction();
      if (!storedHomeStores) {
        localDataSource.storeHomeStores(source);
        storedHomeStores = true;
      }
      return Right(source);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
