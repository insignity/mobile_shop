import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';
import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BestSellerEntity>>> getBestSellers();
  Future<Either<Failure, List<HomeStoreEntity>>> getHomeStores();
}
