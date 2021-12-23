import 'package:mobile_shop/core/services/db/bestseller_table.dart';
import 'package:mobile_shop/core/services/db/homestore_table.dart';
import 'package:mobile_shop/features/home/data/models/best_seller_model.dart';
import 'package:mobile_shop/features/home/data/models/home_store_model.dart';

abstract class HomeLocalDataSource {
  Future storeBestSellers(List<BestSellerModel> bestSellers);
  Future storeHomeStores(List<HomeStoreModel> homestores);
  Future<List<HomeStoreModel>> getHomeStores();
  Future<List<BestSellerModel>> getBestSellers();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<BestSellerModel>> getBestSellers() {
    return BestSellerTable.bestSellerTable.read();
  }

  @override
  Future<List<HomeStoreModel>> getHomeStores() {
    return HomeStoreTable.homeStoreTable.read();
  }

  @override
  Future storeBestSellers(List<BestSellerModel> bestSellers) {
    BestSellerTable.bestSellerTable.clear();
    return BestSellerTable.bestSellerTable.insert(bestSellers);
  }

  @override
  Future storeHomeStores(List<HomeStoreModel> homestores) {
    HomeStoreTable.homeStoreTable.clear();
    return HomeStoreTable.homeStoreTable.insert(homestores);
  }
}
