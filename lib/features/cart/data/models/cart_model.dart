import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';

import 'basket_model.dart';

part 'cart_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CartModel extends CartEntity {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'Delivery')
  String delivery;
  @JsonKey(name: 'basket')
  List<BasketModel> basket;

  CartModel({
    required this.id,
    required this.basket,
    required total,
    required this.delivery,
  }) : super(id: id, basket: basket, total: total, delivery: delivery);

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  factory CartModel.fromMap(Map<String, dynamic> map) => CartModel(
        id: map["_id"],
        basket: basketModelFromJson(map['basket']),
        total: int.parse(map["total"]),
        delivery: map["delivery"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "basket": basketModelToJson(basket),
        "total": total.toString(),
        "Delivery": delivery,
      };
}
