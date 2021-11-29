import 'package:equatable/equatable.dart';

import 'basket_entity.dart';

class CartEntity extends Equatable {
  CartEntity({
    required this.id,
    required this.basket,
    required this.total,
    required this.delivery,
  });

  String id;
  List<BasketEntity> basket;
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
