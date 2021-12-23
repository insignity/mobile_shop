import 'dart:developer';
import 'package:mobile_shop/core/services/db/database.dart';
import 'package:mobile_shop/core/services/db/product_table.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future storeProducts(List<ProductModel> products);
  Future<List<ProductModel>> getProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  var db = DBProvider.db;
  @override
  Future<List<ProductModel>> getProducts() {
    return ProductTable.productTable.read();
  }

  @override
  Future storeProducts(List<ProductModel> products) {
    ProductTable.productTable.clear();
    return ProductTable.productTable.insert(products);
  }
}
