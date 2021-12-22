import 'dart:developer';

import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/core/services/db/query.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class ProductTable extends Query {
  ProductTable._();
  static final ProductTable productTable = ProductTable._();

  final String _tableName = Strings.products;

  @override
  Future insert(model) async {
    Database db = await DBProvider.db.database;
    model.forEach((product) async {
      await db.insert(_tableName, product.toMap());
    });
  }

  @override
  Future clear() async {
    Database db = await DBProvider.db.database;
    db.delete(_tableName);
  }

  @override
  Future<List<ProductModel>> read() async {
    Database db = await DBProvider.db.database;
    final List<Map<String, dynamic>> productsMapList =
        await db.query(_tableName);

    final List<ProductModel> productsList = [];
    productsMapList.forEach((productMap) {
      productsList.add(ProductModel.fromMap(productMap));
    });
    return productsList;
  }
}
