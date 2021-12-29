import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_shop/common/paths.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/core/custom/build_button.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';

Widget title(BuildContext context, ProductEntity productEntity) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              productEntity.title!,
              style: Style.txt24,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          // Stars
          RatingBar.builder(
            initialRating: productEntity.rating!,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.only(right: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemSize: 20,
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
      buildButton(context, Image.asset(Paths.favoriteWhite))
    ],
  );
}
