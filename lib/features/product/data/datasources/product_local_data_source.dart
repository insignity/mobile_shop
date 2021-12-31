import 'dart:developer';
import 'package:mobile_shop/core/services/db/database.dart';
import 'package:mobile_shop/core/services/db/product_table.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future storeProducts(ProductModel products);
  Future<ProductModel> getProduct();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  var db = DBProvider.db;
  @override
  Future<ProductModel> getProduct() {
    return ProductTable.productTable.read();
  }

  @override
  Future storeProducts(ProductModel product) {
    ProductTable.productTable.clear();
    return ProductTable.productTable.insert(product);
  }
}
