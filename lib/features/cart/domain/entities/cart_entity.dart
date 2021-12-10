import 'package:equatable/equatable.dart';
import 'package:mobile_shop/features/cart/data/models/basket_model.dart';

class CartEntity extends Equatable {
  CartEntity({
    required this.id,
    required this.basket,
    required this.total,
    required this.delivery,
  });

  String id;
  List<BasketModel> basket;
  int total;
  String delivery;

  @override
  List<Object?> get props => [
        id,
        basket,
        total,
        delivery,
      ];
}
