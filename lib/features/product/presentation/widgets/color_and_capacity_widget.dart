import 'package:flutter/cupertino.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/paths.dart';
import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

colorAndCapacity(ProductEntity product, BuildContext context) => [
      Padding(
        padding: const EdgeInsets.only(top: 29, left: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.selectColorAndCapacity,
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
                      ? Image.asset(Paths.ok)
                      : Container(),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                          int.parse(Strings.t0xff + color.substring(1))))),
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
                  : SizedBox(
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
