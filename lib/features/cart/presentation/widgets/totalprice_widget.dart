import 'package:flutter/material.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobile_shop/features/home/presentation/widgets/best_seller_card.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 55.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: Style.txtWhite15w400,
              ),
              Text(
                'Delivery',
                style: Style.txtWhite15w400,
              )
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                toPrice(cart.total) + ' us',
                style: Style.txtWhite15,
              ),
              Text(
                cart.delivery,
                style: Style.txtWhite15,
              )
            ],
          ),
        ),
      ],
    );
  }
}
