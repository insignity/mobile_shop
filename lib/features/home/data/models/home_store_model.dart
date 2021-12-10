import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';

class HomeStoreModel extends HomeStoreEntity {
  const HomeStoreModel({
    required id,
    isNew,
    isFavorites,
    required title,
    required subtitle,
    required picture,
    required isBuy,
  }) : super(
            id: id,
            isNew: isNew,
            isFavorites: isFavorites,
            title: title,
            subtitle: subtitle,
            picture: picture,
            isBuy: isBuy);

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) => HomeStoreModel(
        id: json["id"],
        isNew: json["is_new"] ?? null,
        isFavorites: json["is_favorites"] ?? null,
        title: json["title"],
        subtitle: json["subtitle"],
        picture: json["picture"],
        isBuy: json["is_buy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_new": isNew,
        "is_favorites": isFavorites,
        "title": title,
        "subtitle": subtitle,
        "picture": picture,
        "is_buy": isBuy,
      };

  factory HomeStoreModel.fromMap(Map<String, dynamic> map) => HomeStoreModel(
        id: int.parse(map["id"]),
        isNew: map["is_new"] != null
            ? map['is_new'] == 'true'
                ? true
                : false
            : null,
        isFavorites: map["is_favorites"] != null
            ? map['is_favorites'] == 'true'
                ? true
                : false
            : null,
        title: map["title"],
        subtitle: map["subtitle"] ?? '',
        picture: map["picture"],
        isBuy: map['is_buy'] == 'true' ? true : false,
      );

  Map<String, dynamic> toMap() => {
        "id": id.toString(),
        "is_new": isNew != null ? isNew.toString() : '',
        "is_favorites": isFavorites != null ? isFavorites.toString() : '',
        "title": title,
        "subtitle": subtitle,
        "picture": picture,
        "is_buy": isBuy.toString()
      };
}
