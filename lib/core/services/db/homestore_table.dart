import 'dart:developer';

import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/core/services/db/query.dart';
import 'package:mobile_shop/features/home/data/models/home_store_model.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class HomeStoreTable extends Query {
  HomeStoreTable._();
  static final HomeStoreTable homeStoreTable = HomeStoreTable._();

  final String _tableName = Strings.homestores;

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
  Future<List<HomeStoreModel>> read() async {
    Database db = await DBProvider.db.database;
    final List<Map<String, dynamic>> homeStoresMapList =
        await db.query(_tableName);

    final List<HomeStoreModel> homeStoresList = [];
    homeStoresMapList.forEach((productMap) {
      homeStoresList.add(HomeStoreModel.fromMap(productMap));
    });
    return homeStoresList;
  }
}
