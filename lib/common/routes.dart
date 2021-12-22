import 'package:flutter/material.dart';
import 'package:mobile_shop/features/cart/presentation/pages/cart_page.dart';
import 'package:mobile_shop/features/home/presentation/pages/home_map.dart';
import 'package:mobile_shop/features/home/presentation/pages/home_page.dart';
import 'package:mobile_shop/features/product/presentation/pages/product_page.dart';

class Routes {
  static Map<String, Widget Function(dynamic)> routes = {
    home: (context) => HomePage(),
    product: (context) => const ProductPage(),
    cart: (context) => const CartPage(),
    map: (context) => const HomeMap(),
  };
  static const home = '/';
  static const product = '/product';
  static const cart = '/cart';
  static const map = '/home/map';
}
