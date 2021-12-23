import 'package:mobile_shop/core/error/exception.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_shop/features/product/data/datasources/product_local_data_source.dart';
import 'package:mobile_shop/features/product/data/datasources/product_remote_data_source.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';
import 'package:mobile_shop/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  bool gotDataFromRemote = false;
  ProductRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    return _getProducts(() => gotDataFromRemote
        ? localDataSource.getProducts()
        : remoteDataSource.getProducts());
  }

  Future<Either<Failure, List<ProductModel>>> _getProducts(
      Future<List<ProductModel>> Function() getFunction) async {
    try {
      final source = await getFunction();
      if (!gotDataFromRemote) {
        localDataSource.storeProducts(source);
        gotDataFromRemote = true;
      }
      return Right(source);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
