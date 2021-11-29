import 'package:mobile_shop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/usecases/usecase.dart';
import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';
import 'package:mobile_shop/features/home/domain/repositories/best_seller_repository.dart';

class GetBestSellers extends UseCase<List<BestSellerEntity>> {
  final HomeRepository homeRepository;

  GetBestSellers(this.homeRepository);

  @override
  Future<Either<Failure, List<BestSellerEntity>>> call() async {
    return await homeRepository.getBestSellers();
  }
}
