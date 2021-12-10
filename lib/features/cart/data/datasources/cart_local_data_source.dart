import 'dart:developer';

import 'package:mobile_shop/core/db/database.dart';
import 'package:mobile_shop/features/cart/data/models/cart_model.dart';

abstract class CartLocalDataSource {
  Future storeCart(CartModel cart);
  Future<CartModel> getCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  var db = DBProvider.db;
  @override
  Future<CartModel> getCart() {
    log('getProductLocal');
    return db.getCart();
  }

  @override
  Future storeCart(CartModel cart) {
    db.clearCart();
    return db.insertCart(cart);
  }
}
