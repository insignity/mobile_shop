import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/error/failure.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
