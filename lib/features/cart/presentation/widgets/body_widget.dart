import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobile_shop/features/cart/presentation/widgets/items_widget.dart';
import 'package:mobile_shop/features/cart/presentation/widgets/totalprice_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Clr.darkBlue, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          ItemsWidget(cart: cart),
          Divider(
            color: Colors.white.withAlpha(66),
            thickness: 2,
          ),
          TotalPriceWidget(cart: cart),
          Divider(
            color: Colors.white.withAlpha(66),
            thickness: 2,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 54,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.checkout,
                      style: Style.txtWhite20,
                    ),
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
