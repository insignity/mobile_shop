import 'package:flutter/material.dart';
import 'package:mobile_shop/common/paths.dart';
import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.only(left: 23, top: 60),
        child: ListView.builder(
          itemCount: cart.basket.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 88,
                  width: 88,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      cart.basket.first.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 150,
                      child: Text(cart.basket.first.title,
                          style: Style.txtWhite20w500, maxLines: 2),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 150,
                      child: Text(
                        Strings.dollar +
                            cart.basket.first.price.toString() +
                            Strings.zeros,
                        style: Style.txtOrange20w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 33,
                ),
                Container(
                  width: 26,
                  decoration: BoxDecoration(
                      color: Color(0xff282843),
                      borderRadius: BorderRadius.circular(26)),
                  child: Column(
                    children: [
                      const Text(
                        '-',
                        style: Style.txtWhite20w500,
                      ),
                      Text(
                        cart.basket.length.toString(),
                        style: Style.txtWhite20w500,
                      ),
                      const Text(
                        '+',
                        style: Style.txtWhite20w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                SizedBox(width: 20, child: Image.asset(Paths.trash))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
