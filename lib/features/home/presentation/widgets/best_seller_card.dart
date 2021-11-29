import 'package:flutter/material.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';

Widget bestSellerCard(BestSellerEntity product) {
  return Container(
    padding: const EdgeInsets.only(left: 21, bottom: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                product.picture,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: 11,
                  right: 15,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(15, 0, 0, 0),
                          offset: Offset.zero,
                          spreadRadius: 20,
                          blurRadius: 20)
                    ], shape: BoxShape.circle, color: Colors.white),
                    child: Image.asset(
                      product.isFavorites
                          ? 'assets/icons/favorite_filled.png'
                          : 'assets/icons/favorite.png',
                      height: 15,
                    ),
                  )),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              toPrice(product.discountPrice),
              style: Style.txt16,
            ),
            const SizedBox(width: 7),
            Text(
              toPrice(product.priceWithoutDiscount),
              style: Style.txt10crossed,
            ),
          ],
        ),
        Text(
          product.title,
          style: Style.txt10,
          textAlign: TextAlign.start,
        )
      ],
    ),
  );
}

String toPrice(int price) {
  String result = price > 1000
      ? (price ~/ 1000).toString() +
          ',' +
          (price ~/ 100 % 10 > 0 ? "${price ~/ 100 % 10}" : "0") +
          (price % 100 ~/ 10 > 0 ? "${price % 100 ~/ 10}" : "0") +
          '${price % 10}'
      : price.toString();
  return '\$' + result;
}
