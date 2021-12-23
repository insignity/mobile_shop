import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_shop/features/cart/domain/entities/basket_entity.dart';

part 'basket_model.g.dart';

List<BasketModel> basketModelFromJson(String str) => List<BasketModel>.from(
    json.decode(str).map((x) => BasketModel.fromJson(x)));

String basketModelToJson(List<BasketModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class BasketModel extends BasketEntity {
  BasketModel({required title, required image, required price})
      : super(title: title, image: image, price: price);

  factory BasketModel.fromJson(Map<String, dynamic> json) =>
      _$BasketModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketModelToJson(this);

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
