import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';
part 'home_store_model.g.dart';

@JsonSerializable()
class HomeStoreModel extends HomeStoreEntity {
  @JsonKey(name: 'is_buy')
  bool isBuy;
  @JsonKey(name: 'is_favorites')
  bool? isFavorites;
  @JsonKey(name: 'is_new')
  bool? isNew;
  HomeStoreModel({
    required int id,
    this.isNew,
    this.isFavorites,
    required String title,
    required String subtitle,
    required String picture,
    required this.isBuy,
  }) : super(
            id: id,
            isNew: isNew,
            isFavorites: isFavorites,
            title: title,
            subtitle: subtitle,
            picture: picture,
            isBuy: isBuy);

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) =>
      _$HomeStoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeStoreModelToJson(this);

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
