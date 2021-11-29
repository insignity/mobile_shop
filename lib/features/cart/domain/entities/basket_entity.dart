import 'package:equatable/equatable.dart';

class BasketEntity extends Equatable {
  BasketEntity({
    required this.title,
    required this.image,
    required this.price,
  });

  String title;
  String image;
  int price;

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        image,
        price,
      ];
}
