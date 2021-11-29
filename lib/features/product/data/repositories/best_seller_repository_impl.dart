import 'package:mobile_shop/core/error/exception.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_shop/features/product/data/datasources/product_data_source.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';
import 'package:mobile_shop/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
    return _getProducts(() => remoteDataSource.getProductDetails());
  }

  Future<Either<Failure, List<ProductEntity>>> _getProducts(
      Future<List<ProductEntity>> Function() getFunction) async {
    try {
      final remoteProducts = await getFunction();
      return Right(remoteProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
