import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_shop/core/error/exception.dart';
import 'package:mobile_shop/features/home/data/models/best_seller_model.dart';
import 'package:mobile_shop/features/home/data/models/home_store_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BestSellerModel>> getBestSellers();
  Future<List<HomeStoreModel>> getHomeStores();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  dynamic answer;

  Future _getJsonData() async {
    print('getJsonData');
    final response = await http.get(
        Uri.parse('https://db2021ecom-edca.restdb.io/rest/main'),
        headers: {
          'accept': 'application/json',
          'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'
        });
    if (response.statusCode == 200) {
      answer = json.decode(response.body);
    } else {
      throw ServerException();
    }
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
        .map((bestSeller) => HomeStoreModel.fromJson(bestSeller))
        .toList();
  }
}
