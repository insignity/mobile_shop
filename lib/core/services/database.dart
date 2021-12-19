import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:mobile_shop/features/cart/data/models/cart_model.dart';
import 'package:mobile_shop/features/home/data/models/best_seller_model.dart';
import 'package:mobile_shop/features/home/data/models/home_store_model.dart';
import 'package:mobile_shop/features/product/data/models/product_model.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

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

    String bestId = 'id';
    String bestIsFavorites = 'is_favorites';
    String bestTitle = 'title';
    String bestPriceWD = 'price_without_discount';
    String bestDiscountPrice = 'discount_price';
    String bestPicture = 'picture';

    String homeid = 'id';
    String homeisNew = 'is_new';
    String homeisFavorites = 'is_favorites';
    String hometitle = 'title';
    String homesubtitle = 'subtitle';
    String homepicture = 'picture';
    String homeisBuy = 'is_buy';

    String columnId = 'id';
    String columnImages = 'images';
    String columnIsFavorites = 'is_favorites';
    String columnTitle = 'title';
    String columnRating = 'rating';
    String columnCpu = 'cpu';
    String columnCamera = 'camera';
    String columnSsd = 'ssd';
    String columnSd = 'sd';
    String columnColor = 'color';
    String columnCapacity = 'capacity';
    String columnPrice = 'price';

    String cartColumnId = '_id';
    String cartColumnBasket = 'basket';
    String cartColumnTotal = 'total';
    String cartColumnDelivery = 'delivery';

    await db.execute('''CREATE TABLE IF NOT EXISTS $_productsTable(
          $columnId TEXT, 
          $columnImages TEXT,
          $columnIsFavorites TEXT,
          $columnTitle TEXT,
          $columnRating TEXT,
          $columnCpu TEXT,
          $columnCamera TEXT,
          $columnSsd TEXT,
          $columnSd TEXT,
          $columnColor TEXT,
          $columnCapacity TEXT,
          $columnPrice INTEGER
    )''');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_cartTable(
          $cartColumnId TEXT, 
          $cartColumnBasket TEXT, 
          $cartColumnTotal TEXT, 
          $cartColumnDelivery TEXT
        )''');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_bestSellersTable(
          $bestId TEXT, 
          $bestIsFavorites TEXT, 
          $bestTitle TEXT, 
          $bestPriceWD TEXT,
          $bestDiscountPrice TEXT,
          $bestPicture TEXT
        )''');

    await db.execute('''CREATE TABLE IF NOT EXISTS $_homeStoresTable(
          $homeid TEXT, 
          $homeisNew TEXT, 
          $homeisFavorites TEXT, 
          $hometitle TEXT,
          $homesubtitle TEXT,
          $homepicture TEXT,
          $homeisBuy TEXT
        )''');
  }

// READ BESTSELLERS
  Future<List<BestSellerModel>> getBestSellers() async {
    Database db = await database;
    final List<Map<String, dynamic>> bestSellersMapList =
        await db.query(_bestSellersTable);

    final List<BestSellerModel> bestSellersList = [];
    bestSellersMapList.forEach((productMap) {
      bestSellersList.add(BestSellerModel.fromMap(productMap));
    });
    return bestSellersList;
  }

  // INSERT BESTSELLERS
  Future insertBestSellers(List<BestSellerModel> bestSellers) async {
    Database db = await database;
    bestSellers.forEach((product) async {
      await db.insert(_bestSellersTable, product.toMap());
    });
  }

  // DELETE ALL BESTSELLERS
  Future clearBestSellers() async {
    log('Clearing table $_bestSellersTable');
    Database db = await database;
    db.delete(_bestSellersTable);
  }

// READ HOMESTORES
  Future<List<HomeStoreModel>> getHomeStores() async {
    Database db = await database;
    final List<Map<String, dynamic>> homeStoresMapList =
        await db.query(_homeStoresTable);

    final List<HomeStoreModel> homeStoresList = [];
    homeStoresMapList.forEach((productMap) {
      homeStoresList.add(HomeStoreModel.fromMap(productMap));
    });
    return homeStoresList;
  }

  // INSERT HOMESTORES
  Future insertHomeStores(List<HomeStoreModel> homeStores) async {
    Database db = await database;
    homeStores.forEach((product) async {
      await db.insert(_homeStoresTable, product.toMap());
    });
  }

  // DELETE ALL HOMESTORES
  Future clearHomeStores() async {
    log('Clearing table $_homeStoresTable');
    Database db = await database;
    db.delete(_homeStoresTable);
  }

  // READ PRODUCTS
  Future<List<ProductModel>> getProducts() async {
    Database db = await database;
    final List<Map<String, dynamic>> productsMapList =
        await db.query(_productsTable);

    final List<ProductModel> productsList = [];
    productsMapList.forEach((productMap) {
      productsList.add(ProductModel.fromMap(productMap));
    });
    return productsList;
  }

  // INSERT PRODUCTS
  Future insertProducts(List<ProductModel> products) async {
    Database db = await database;
    products.forEach((product) async {
      await db.insert(_productsTable, product.toMap());
    });
  }

  // DELETE ALL PRODUCTS
  Future clearProducts() async {
    log('Clearing table $_productsTable');
    Database db = await database;
    db.delete(_productsTable);
  }

  // READ CART
  Future<CartModel> getCart() async {
    Database db = await database;
    final List<Map<String, dynamic>> cartMapList = await db.query(_cartTable);

    final CartModel cart = CartModel.fromMap(cartMapList.first);

    return cart;
  }

  // INSERT CART
  Future insertCart(CartModel cart) async {
    Database db = await database;
    await db.insert(_cartTable, cart.toMap());
  }

  // DELETE ALL CART
  Future clearCart() async {
    log('Clearing table $_cartTable');
    Database db = await database;
    db.delete(_cartTable);
  }
}
