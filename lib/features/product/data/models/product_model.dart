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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        images: List<String>.from(json["images"].map((x) => x)),
        isFavorites: json["is_favorites"],
        title: json["title"],
        rating: json["rating"].toDouble(),
        cpu: json["CPU"],
        camera: json["camera"],
        ssd: json["ssd"],
        sd: json["sd"],
        color: List<String>.from(json["color"].map((x) => x)),
        capacity: List<String>.from(json["capacity"].map((x) => x)),
        price: json["price"],
      );

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
}
