import 'package:mobile_shop/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_shop/core/usecases/usecase.dart';
import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';
import 'package:mobile_shop/features/home/domain/repositories/home_repository.dart';

class GetHomeStores extends UseCase<List<HomeStoreEntity>> {
  final HomeRepository homeRepository;

  GetHomeStores(this.homeRepository);

  @override
  Future<Either<Failure, List<HomeStoreEntity>>> call() async {
    return await homeRepository.getHomeStores();
  }
}
