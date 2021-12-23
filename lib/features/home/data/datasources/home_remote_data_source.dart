import 'dart:developer';

import 'package:mobile_shop/core/services/client.dart';
import 'package:mobile_shop/features/home/data/models/best_seller_model.dart';
import 'package:mobile_shop/features/home/data/models/home_store_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BestSellerModel>> getBestSellers();
  Future<List<HomeStoreModel>> getHomeStores();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final RestClient client;
  HomeRemoteDataSourceImpl({required this.client});

  dynamic answer;
  Future _getJsonData() async {
    final response = await client.getMain();
    answer = response;
  }

  @override
  Future<List<BestSellerModel>> getBestSellers() async {
    if (answer == null) {
      await _getJsonData();
    }
    return (answer[0]['best_seller'] as List)
        .map((bestSeller) => BestSellerModel.fromJson(bestSeller))
        .toList();
  }

  @override
  Future<List<HomeStoreModel>> getHomeStores() async {
    if (answer == null) {
      await _getJsonData();
    }
    return (answer[0]['home_store'] as List)
        .map((homeStores) => HomeStoreModel.fromJson(homeStores))
        .toList();
  }
}
