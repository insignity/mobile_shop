import 'dart:developer';

import 'package:mobile_shop/core/services/database.dart';
import 'package:mobile_shop/features/home/data/models/best_seller_model.dart';
import 'package:mobile_shop/features/home/data/models/home_store_model.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';

abstract class HomeLocalDataSource {
  Future storeBestSellers(List<BestSellerModel> bestSellers);
  Future storeHomeStores(List<HomeStoreModel> homestores);
  Future<List<HomeStoreModel>> getHomeStores();
  Future<List<BestSellerModel>> getBestSellers();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  var db = DBProvider.db;

  @override
  Future<List<BestSellerModel>> getBestSellers() {
    log('local get bestsellers');
    return db.getBestSellers();
  }

  @override
  Future<List<HomeStoreModel>> getHomeStores() {
    log('local get homestores');
    return db.getHomeStores();
  }

  @override
  Future storeBestSellers(List<BestSellerModel> bestSellers) {
    db.clearBestSellers();
    return db.insertBestSellers(bestSellers);
  }

  @override
  Future storeHomeStores(List<HomeStoreModel> homestores) {
    db.clearHomeStores();
    return db.insertHomeStores(homestores);
  }
}
