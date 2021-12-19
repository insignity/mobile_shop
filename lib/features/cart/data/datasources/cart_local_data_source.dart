import 'dart:developer';

import 'package:mobile_shop/core/services/db/cart_table.dart';
import 'package:mobile_shop/features/cart/data/models/cart_model.dart';

abstract class CartLocalDataSource {
  Future storeCart(CartModel cart);
  Future<CartModel> getCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  @override
  Future<CartModel> getCart() {
    log('getProductLocal');
    return CartTable.cartTable.read();
  }

  @override
  Future storeCart(CartModel cartModel) {
    CartTable.cartTable.clear();
    return CartTable.cartTable.insert(cartModel);
  }
}
