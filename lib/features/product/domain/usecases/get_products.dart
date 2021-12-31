import 'package:mobile_shop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/usecases/usecase.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';
import 'package:mobile_shop/features/product/domain/repositories/product_repository.dart';

class GetProducts extends UseCase<ProductEntity> {
  final ProductRepository productRepository;

  GetProducts(this.productRepository);

  @override
  Future<Either<Failure, ProductEntity>> call() async {
    return await productRepository.getProducts();
  }
}
