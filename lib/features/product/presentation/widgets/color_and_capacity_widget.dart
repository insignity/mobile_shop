import 'package:flutter/cupertino.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';

colorAndCapacity(ProductEntity product) => [
      const Padding(
        padding: EdgeInsets.only(top: 29, left: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Select color and capacity',
            style: Style.txt16w500,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var color in product.color)
              Container(
                  child: color.indexOf(product.color.first) == 0
                      ? Image.asset('assets/icons/ok.png')
                      : Container(),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(int.parse('0xff' + color.substring(1))))),
            const SizedBox(
              width: 0,
            ),
            for (var capacity in product.capacity)
              capacity.indexOf(product.capacity.first) == 0
                  ? Container(
                      child: Center(
                          child: Text(
                        capacity,
                        style: Style.txtWhite13,
                      )),
                      height: 30,
                      width: 72,
                      decoration: BoxDecoration(
                          color: Clr.orange,
                          borderRadius: BorderRadius.circular(10)),
                    )
                  : Container(
                      height: 30,
                      width: 72,
                      child: Center(
                        child: Text(
                          capacity,
                          style: Style.txtDarkGrey13,
                        ),
                      ),
                    )
          ],
        ),
      )
    ];
