import 'dart:developer';
import 'dart:io';
import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/core/services/db/db_strings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  Database? _database;

  final String _bestSellersTable = Strings.bestsellers;
  final String _homeStoresTable = Strings.homestores;
  final String _productsTable = Strings.products;
  final String _cartTable = Strings.cart;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + Strings.databaseName;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE IF NOT EXISTS $_productsTable(
          ${DBStrings.columnId} TEXT, 
          ${DBStrings.columnImages} TEXT,
          ${DBStrings.columnIsFavorites} TEXT,
          ${DBStrings.columnTitle} TEXT,
          ${DBStrings.columnRating} TEXT,
          ${DBStrings.columnCpu} TEXT,
          ${DBStrings.columnCamera} TEXT,
          ${DBStrings.columnSsd} TEXT,
          ${DBStrings.columnSd} TEXT,
          ${DBStrings.columnColor} TEXT,
          ${DBStrings.columnCapacity} TEXT,
          ${DBStrings.columnPrice} INTEGER
    )''');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_cartTable(
          ${DBStrings.cartColumnId} TEXT, 
          ${DBStrings.cartColumnBasket} TEXT, 
          ${DBStrings.cartColumnTotal} TEXT, 
          ${DBStrings.cartColumnDelivery} TEXT
        )''');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_bestSellersTable(
          ${DBStrings.bestId} TEXT, 
          ${DBStrings.bestIsFavorites} TEXT, 
          ${DBStrings.bestTitle} TEXT, 
          ${DBStrings.bestPriceWD} TEXT,
          ${DBStrings.bestDiscountPrice} TEXT,
          ${DBStrings.bestPicture} TEXT
        )''');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_homeStoresTable(
          ${DBStrings.homeid} TEXT, 
          ${DBStrings.homeisNew} TEXT, 
          ${DBStrings.homeisFavorites} TEXT, 
          ${DBStrings.hometitle} TEXT,
          ${DBStrings.homesubtitle} TEXT,
          ${DBStrings.homepicture} TEXT,
          ${DBStrings.homeisBuy} TEXT
        )''');
  }
}
