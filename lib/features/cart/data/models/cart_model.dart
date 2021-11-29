import 'dart:convert';

import 'package:mobile_shop/features/cart/domain/entities/basket_entity.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';

import 'basket_model.dart';

class CartModel extends CartEntity {
  CartModel({
    required id,
    required basket,
    required total,
    required delivery,
  }) : super(id: id, basket: basket, total: total, delivery: delivery);

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["_id"],
        basket: List<BasketEntity>.from(
            json["basket"].map((x) => BasketModel.fromJson(x))),
        total: json["total"],
        delivery: json["Delivery"],
      );
}
