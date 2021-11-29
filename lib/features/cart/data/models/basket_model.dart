import 'package:mobile_shop/features/cart/domain/entities/basket_entity.dart';

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
}
