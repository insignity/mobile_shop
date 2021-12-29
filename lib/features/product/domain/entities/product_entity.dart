import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  ProductEntity({
    this.id,
    this.images,
    this.isFavorites,
    this.title,
    this.rating,
    this.cpu,
    this.camera,
    this.ssd,
    this.sd,
    this.color,
    this.capacity,
    this.price,
  });

  String? id;
  List<String>? images;
  bool? isFavorites;
  String? title;
  double? rating;
  String? cpu;
  String? camera;
  String? ssd;
  String? sd;
  List<String>? color;
  List<String>? capacity;
  int? price;

  @override
  List<Object?> get props => [
        id,
        images,
        isFavorites,
        title,
        rating,
        cpu,
        camera,
        ssd,
        sd,
        color,
        capacity,
        price,
      ];
}
