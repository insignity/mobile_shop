import 'dart:convert';

import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required id,
    required images,
    required isFavorites,
    required title,
    required rating,
    required cpu,
    required camera,
    required ssd,
    required sd,
    required color,
    required capacity,
    required price,
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
    return ProductModel(
      id: json["_id"],
      images: List<String>.from(json["images"].map((x) => x)),
      isFavorites: json["is_favorites"],
      title: json["title"],
      rating: json["rating"],
      cpu: json["CPU"],
      camera: json["camera"],
      ssd: json["ssd"],
      sd: json["sd"],
      color: List<String>.from(json["color"].map((x) => x)),
      capacity: List<String>.from(json["capacity"].map((x) => x)),
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "is_favorites": isFavorites,
        "title": title,
        "rating": rating,
        "CPU": cpu,
        "camera": camera,
        "ssd": ssd,
        "sd": sd,
        "color": List<dynamic>.from(color.map((x) => x)),
        "capacity": List<dynamic>.from(capacity.map((x) => x)),
        "price": price,
      };

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
    return ProductModel(
      id: map["id"],
      images: (map['images'] as String)
          .substring(1, (map['images'] as String).length - 1)
          .split(', '),
      isFavorites: map["is_favorites"] == 'true' ? true : false,
      title: map["title"],
      rating: double.parse(map['rating']),
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
      price: map["price"],
    );
  }
}
