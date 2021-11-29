import 'package:mobile_shop/core/error/exception.dart';
import 'package:mobile_shop/features/home/data/datasources/home_remote_data_source.dart';
import 'package:mobile_shop/features/home/data/models/best_seller_model.dart';
import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';
import 'package:mobile_shop/features/home/domain/repositories/best_seller_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BestSellerEntity>>> getBestSellers() {
    return _getBestSellers(() => remoteDataSource.getBestSellers());
  }

  Future<Either<Failure, List<BestSellerEntity>>> _getBestSellers(
      Future<List<BestSellerModel>> Function() getCategorys) async {
    try {
      final remoteCategory = await getCategorys();
      return Right(remoteCategory);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<HomeStoreEntity>>> getHomeStores() {
    return _getHomeStores(() => remoteDataSource.getHomeStores());
  }

  Future<Either<Failure, List<HomeStoreEntity>>> _getHomeStores(
      Future<List<HomeStoreEntity>> Function() getFunction) async {
    try {
      final remoteHomeStore = await getFunction();
      return Right(remoteHomeStore);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
