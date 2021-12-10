import 'dart:developer';

import 'package:mobile_shop/core/db/database.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future storeProducts(List<ProductModel> products);
  Future<List<ProductModel>> getProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  var db = DBProvider.db;
  @override
  Future<List<ProductModel>> getProducts() {
    log('getProductLocal');
    return db.getProducts();
  }

  @override
  Future storeProducts(List<ProductModel> products) {
    db.clearProducts();
    return db.insertProducts(products);
  }
}
