import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  ProductEntity({
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.title,
    required this.rating,
    required this.cpu,
    required this.camera,
    required this.ssd,
    required this.sd,
    required this.color,
    required this.capacity,
    required this.price,
  });

  String id;
  List<String> images;
  bool isFavorites;
  String title;
  double rating;
  String cpu;
  String camera;
  String ssd;
  String sd;
  List<String> color;
  List<String> capacity;
  int price;

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
