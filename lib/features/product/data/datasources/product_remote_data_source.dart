import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mobile_shop/core/error/exception.dart';
import 'package:mobile_shop/core/services/database.dart';
import 'package:mobile_shop/features/product/data/datasources/product_local_data_source.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  dynamic answer;

  Future _getJsonData() async {
    log('_getJsonData');
    final response = await http.get(
        Uri.parse('https://db2021ecom-edca.restdb.io/rest/productdetails'),
        headers: {
          'accept': 'application/json',
          'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'
        });
    if (response.statusCode == 200) {
      log(response.body);
      answer = json.decode(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    log('getProductRemote');
    if (answer == null) {
      await _getJsonData();
    }
    return (answer as List)
        .map((products) => ProductModel.fromJson(products))
        .toList();
  }
}
