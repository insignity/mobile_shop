import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';

class BestSellerModel extends BestSellerEntity {
  const BestSellerModel({
    required id,
    required isFavorites,
    required title,
    required priceWithoutDiscount,
    required discountPrice,
    required picture,
  }) : super(
            id: id,
            isFavorites: isFavorites,
            title: title,
            priceWithoutDiscount: priceWithoutDiscount,
            discountPrice: discountPrice,
            picture: picture);

  factory BestSellerModel.fromJson(Map<String, dynamic> json) =>
      BestSellerModel(
        id: json["id"],
        isFavorites: json["is_favorites"],
        title: json["title"],
        priceWithoutDiscount: json["price_without_discount"],
        discountPrice: json["discount_price"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_favorites": isFavorites,
        "title": title,
        "price_without_discount": priceWithoutDiscount,
        "discount_price": discountPrice,
        "picture": picture,
      };
  factory BestSellerModel.fromMap(Map<String, dynamic> map) => BestSellerModel(
        id: int.parse(map["id"]),
        isFavorites: map["is_favorites"] == 'true' ? true : false,
        title: map["title"],
        priceWithoutDiscount: int.parse(map["price_without_discount"]),
        discountPrice: int.parse(map["discount_price"]),
        picture: map["picture"],
      );

  Map<String, dynamic> toMap() => {
        "id": id.toString(),
        "is_favorites": isFavorites.toString(),
        "title": title,
        "price_without_discount": priceWithoutDiscount.toString(),
        "discount_price": discountPrice.toString(),
        "picture": picture,
      };
}
