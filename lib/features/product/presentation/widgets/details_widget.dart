import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/paths.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<Widget> detailsWidget(ProductEntity productEntity, BuildContext context) {
  return [
    Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.shop,
                style: Style.txt20,
              ),
              Container(
                width: 86,
                decoration: const BoxDecoration(
                    border:
                        Border.fromBorderSide(BorderSide(color: Clr.orange))),
              )
            ],
          ),
          Text(
            AppLocalizations.of(context)!.details,
            style: Style.txt20opacity50,
          ),
          Text(
            AppLocalizations.of(context)!.features,
            style: Style.txt20opacity50,
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 33.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset(Paths.cpu),
              const SizedBox(
                height: 5,
              ),
              Text(productEntity.cpu, style: Style.txtGrey11)
            ],
          ),
          Column(
            children: [
              Image.asset(Paths.camera),
              const SizedBox(
                height: 5,
              ),
              Text(productEntity.camera, style: Style.txtGrey11)
            ],
          ),
          Column(
            children: [
              Image.asset(Paths.ssd),
              const SizedBox(
                height: 5,
              ),
              Text(productEntity.ssd, style: Style.txtGrey11)
            ],
          ),
          Column(
            children: [
              Image.asset(Paths.sd),
              const SizedBox(
                height: 5,
              ),
              Text(productEntity.sd, style: Style.txtGrey11)
            ],
          ),
        ],
      ),
    )
  ];
}
