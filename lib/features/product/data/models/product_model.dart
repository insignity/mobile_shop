import 'dart:convert';

import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'is_favorites')
  bool? isFavorites;
  @JsonKey(name: 'CPU')
  String? cpu;
  ProductModel({
    required this.id,
    required List<String>? images,
    required this.isFavorites,
    required String? title,
    required double? rating,
    required this.cpu,
    required String? camera,
    required String? ssd,
    required String? sd,
    required List<String>? color,
    required List<String>? capacity,
    required int? price,
  }) : super(
            id: id,
            images: images,
            isFavorites: isFavorites,
            title: title,
            rating: rating,
            cpu: cpu,
            camera: camera,
            ssd: ssd,
            sd: sd,
            color: color,
            capacity: capacity,
            price: price);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    print('fromjson');
    print(json);
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map["id"] = id;
    map["images"] = images.toString();
    map["is_favorites"] = isFavorites.toString();
    map["title"] = title;
    map["rating"] = rating.toString();
    map["CPU"] = cpu;
    map["camera"] = camera;
    map["ssd"] = ssd;
    map["sd"] = sd;
    map["color"] = color.toString();
    map["capacity"] = capacity.toString();
    map["price"] = price.toString();
    return map;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return ProductModel(
      id: map["id"],
      images: (map['images'] as String)
          .substring(1, (map['images'] as String).length - 1)
          .split(', '),
      isFavorites: map["is_favorites"] == 'true' ? true : false,
      title: map["title"],
      rating: double.tryParse(map['rating']),
      cpu: map["cpu"],
      camera: map["camera"],
      ssd: map["ssd"],
      sd: map["sd"],
      color: (map['color'] as String)
          .substring(1, (map['color'] as String).length - 1)
          .split(', '),
      capacity: (map['capacity'] as String)
          .substring(1, (map['capacity'] as String).length - 1)
          .split(', '),
      price: map["price"] as int,
    );
  }
}
