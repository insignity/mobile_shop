import 'dart:developer';

import 'package:mobile_shop/core/services/db/query.dart';
import 'package:mobile_shop/features/cart/data/models/cart_model.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class CartTable extends Query {
  CartTable._();
  static final CartTable cartTable = CartTable._();

  final String _tableName = 'cart';

  @override
  Future insert(model) async {
    Database db = await DBProvider.db.database;
    await db.insert(_tableName, model.toMap());
  }

  @override
  Future clear() async {
    log('Clearing table $_tableName');
    Database db = await DBProvider.db.database;
    db.delete(_tableName);
  }

  @override
  Future<CartModel> read() async {
    Database db = await DBProvider.db.database;
    final List<Map<String, dynamic>> cartMapList = await db.query(_tableName);
    final CartModel cart = CartModel.fromMap(cartMapList.first);
    return cart;
  }
}
