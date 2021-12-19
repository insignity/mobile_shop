import 'dart:developer';

import 'package:mobile_shop/core/services/db/query.dart';
import 'package:mobile_shop/features/home/data/models/best_seller_model.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class BestSellerTable extends Query {
  BestSellerTable._();
  static final BestSellerTable bestSellerTable = BestSellerTable._();

  final String _tableName = 'bestsellers';

  @override
  Future insert(model) async {
    Database db = await DBProvider.db.database;
    model.forEach((product) async {
      await db.insert(_tableName, product.toMap());
    });
  }

  @override
  Future clear() async {
    log('Clearing table $_tableName');
    Database db = await DBProvider.db.database;
    db.delete(_tableName);
  }

  @override
  Future<List<BestSellerModel>> read() async {
    Database db = await DBProvider.db.database;
    final List<Map<String, dynamic>> bestSellersMapList =
        await db.query(_tableName);

    final List<BestSellerModel> bestSellersList = [];
    bestSellersMapList.forEach((productMap) {
      bestSellersList.add(BestSellerModel.fromMap(productMap));
    });
    return bestSellersList;
  }
}
