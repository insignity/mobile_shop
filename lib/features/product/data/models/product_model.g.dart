// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['_id'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      isFavorites: json['is_favorites'] as bool,
      title: json['title'] as String,
      rating: (json['rating'] as num).toDouble(),
      cpu: json['CPU'] as String,
      camera: json['camera'] as String,
      ssd: json['ssd'] as String,
      sd: json['sd'] as String,
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      capacity:
          (json['capacity'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as int,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'images': instance.images,
      'title': instance.title,
      'rating': instance.rating,
      'camera': instance.camera,
      'ssd': instance.ssd,
      'sd': instance.sd,
      'color': instance.color,
      'capacity': instance.capacity,
      'price': instance.price,
      '_id': instance.id,
      'is_favorites': instance.isFavorites,
      'CPU': instance.cpu,
    };
