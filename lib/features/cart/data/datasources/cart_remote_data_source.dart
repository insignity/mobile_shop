import 'package:mobile_shop/core/services/client.dart';
import 'package:mobile_shop/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final RestClient client;
  CartRemoteDataSourceImpl({required this.client});

  @override
  Future<CartModel> getCart() async {
    var ans = await client.getMyCart();
    return ans[0];
  }
}
