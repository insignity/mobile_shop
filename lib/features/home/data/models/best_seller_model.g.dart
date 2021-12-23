// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerModel _$BestSellerModelFromJson(Map<String, dynamic> json) =>
    BestSellerModel(
      id: json['id'] as int,
      isFavorites: json['is_favorites'] as bool,
      priceWithoutDiscount: json['price_without_discount'] as int,
      discountPrice: json['discount_price'] as int,
      title: json['title'] as String,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$BestSellerModelToJson(BestSellerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'picture': instance.picture,
      'is_favorites': instance.isFavorites,
      'price_without_discount': instance.priceWithoutDiscount,
      'discount_price': instance.discountPrice,
    };
