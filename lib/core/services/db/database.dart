import 'dart:developer';
import 'dart:io';
import 'package:mobile_shop/common/strings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  Database? _database;

  final String _bestSellersTable = 'bestsellers';
  final String _homeStoresTable = 'homestores';
  final String _productsTable = 'products';
  final String _cartTable = 'cart';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'database9.db';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int version) async {
    log('creating table');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_productsTable(
          ${Strings.columnId} TEXT, 
          ${Strings.columnImages} TEXT,
          ${Strings.columnIsFavorites} TEXT,
          ${Strings.columnTitle} TEXT,
          ${Strings.columnRating} TEXT,
          ${Strings.columnCpu} TEXT,
          ${Strings.columnCamera} TEXT,
          ${Strings.columnSsd} TEXT,
          ${Strings.columnSd} TEXT,
          ${Strings.columnColor} TEXT,
          ${Strings.columnCapacity} TEXT,
          ${Strings.columnPrice} INTEGER
    )''');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_cartTable(
          ${Strings.cartColumnId} TEXT, 
          ${Strings.cartColumnBasket} TEXT, 
          ${Strings.cartColumnTotal} TEXT, 
          ${Strings.cartColumnDelivery} TEXT
        )''');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_bestSellersTable(
          ${Strings.bestId} TEXT, 
          ${Strings.bestIsFavorites} TEXT, 
          ${Strings.bestTitle} TEXT, 
          ${Strings.bestPriceWD} TEXT,
          ${Strings.bestDiscountPrice} TEXT,
          ${Strings.bestPicture} TEXT
        )''');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_homeStoresTable(
          ${Strings.homeid} TEXT, 
          ${Strings.homeisNew} TEXT, 
          ${Strings.homeisFavorites} TEXT, 
          ${Strings.hometitle} TEXT,
          ${Strings.homesubtitle} TEXT,
          ${Strings.homepicture} TEXT,
          ${Strings.homeisBuy} TEXT
        )''');
  }
}
