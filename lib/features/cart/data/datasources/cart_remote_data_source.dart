import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_shop/core/error/exception.dart';
import 'package:mobile_shop/features/cart/data/models/cart_model.dart';
import 'package:mobile_shop/features/home/data/models/best_seller_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;

  CartRemoteDataSourceImpl({required this.client});

  dynamic answer;

  Future _getJsonData() async {
    final response = await http.get(
        Uri.parse('https://db2021ecom-edca.restdb.io/rest/mycart'),
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
  Future<CartModel> getCart() async {
    if (answer == null) {
      await _getJsonData();
    }
    return CartModel.fromJson(answer[0]);
  }
}
