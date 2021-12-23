import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'best_seller_model.g.dart';

@JsonSerializable()
class BestSellerModel extends BestSellerEntity {
  @JsonKey(name: "is_favorites")
  bool isFavorites;
  @JsonKey(name: "price_without_discount")
  int priceWithoutDiscount;
  @JsonKey(name: "discount_price")
  int discountPrice;

  BestSellerModel({
    required int id,
    required this.isFavorites,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required String title,
    required String picture,
  }) : super(
            id: id,
            isFavorites: isFavorites,
            title: title,
            priceWithoutDiscount: priceWithoutDiscount,
            discountPrice: discountPrice,
            picture: picture);

  factory BestSellerModel.fromJson(Map<String, dynamic> json) =>
      _$BestSellerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerModelToJson(this);

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
