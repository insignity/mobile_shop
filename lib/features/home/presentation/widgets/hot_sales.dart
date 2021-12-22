import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget hotSales(HomeStoreEntity homeStore, BuildContext context) {
  return Stack(
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            homeStore.picture,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )),
      Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeStore.isNew == true
                ? Container(
                    height: 27,
                    width: 27,
                    decoration: const BoxDecoration(
                      color: Clr.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.tNew,
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                  )
                : Container(
                    height: 27,
                    width: 27,
                  ),
            const SizedBox(
              height: 18,
            ),
            Text(
              homeStore.title,
              style: homeStore.id == 2 ? Style.txt25 : Style.txtWhite25,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              homeStore.subtitle,
              style: homeStore.id == 2 ? Style.txt11 : Style.txtWhite11,
            ),
            const SizedBox(
              height: 26,
            ),
            InkWell(
              child: Container(
                  height: 23,
                  width: 98,
                  decoration: BoxDecoration(
                      color: homeStore.id == 2 ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.buyNow,
                        style:
                            homeStore.id == 2 ? Style.txtWhite11 : Style.txt11),
                  )),
              onTap: () {},
            ),
          ],
        ),
      )
    ],
  );
}
