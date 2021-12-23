// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: json['_id'] as String,
      basket: (json['basket'] as List<dynamic>)
          .map((e) => BasketModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'],
      delivery: json['Delivery'] as String,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'total': instance.total,
      '_id': instance.id,
      'Delivery': instance.delivery,
      'basket': instance.basket.map((e) => e.toJson()).toList(),
    };
