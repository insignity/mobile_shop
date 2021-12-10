import 'dart:convert';

import 'package:mobile_shop/features/cart/domain/entities/basket_entity.dart';

List<BasketModel> basketModelFromJson(String str) => List<BasketModel>.from(
    json.decode(str).map((x) => BasketModel.fromJson(x)));

String basketModelToJson(List<BasketModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BasketModel extends BasketEntity {
  BasketModel({required title, required image, required price})
      : super(title: title, image: image, price: price);

  factory BasketModel.fromJson(Map<String, dynamic> json) => BasketModel(
        title: json["title"],
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "price": price,
      };

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    return map;
  }

  factory BasketModel.fromMap(Map<String, dynamic> map) {
    return BasketModel(
      title: map["title"],
      image: map["image"],
      price: map["price"],
    );
  }
}
