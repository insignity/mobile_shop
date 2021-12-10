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
        basket: List<BasketModel>.from(
            json["basket"].map((x) => BasketModel.fromJson(x))),
        total: json["total"],
        delivery: json["Delivery"],
      );

  factory CartModel.fromMap(Map<String, dynamic> map) => CartModel(
        id: map["_id"],
        basket: basketModelFromJson(map['basket']),
        total: int.parse(map["total"]),
        delivery: map["delivery"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "basket": List<dynamic>.from(basket.map((x) => x.toJson())),
        "total": total,
        "Delivery": delivery,
      };

  Map<String, dynamic> toMap() => {
        "_id": id,
        "basket": basketModelToJson(basket),
        "total": total.toString(),
        "Delivery": delivery,
      };
}
