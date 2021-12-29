import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/paths.dart';
import 'package:mobile_shop/common/routes.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/core/custom/build_button.dart';
import 'package:mobile_shop/features/home/presentation/widgets/best_seller_card.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_shop/features/product/presentation/widgets/color_and_capacity_widget.dart';
import 'package:mobile_shop/features/product/presentation/widgets/details_widget.dart';
import 'package:mobile_shop/features/product/presentation/widgets/title_widget.dart';

class ProductLoadedPage extends StatelessWidget {
  List<ProductEntity> products;
  ProductLoadedPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      // Header
      Padding(
        padding:
            const EdgeInsets.only(left: 42.0, right: 35, top: 35, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildButton(
              context,
              Icon(Icons.arrow_back_ios_new),
            ),
            Text(
              AppLocalizations.of(context)!.productDetails,
              style: Style.txt18,
            ),
            buildButton(context, Image.asset(Paths.bag), color: Clr.orange)
          ],
        ),
      ),
      // Swiper
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 941 * 349,
        child: Swiper(
          viewportFraction: 0.6,
          scale: 0.9,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.091),
                    offset: Offset(-2.83, 14.93),
                    blurRadius: 9.03,
                    spreadRadius: 6.05,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  products[0].images![0],
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          itemCount:
              products[0].images!.length > 1 ? products[0].images!.length : 2,
          pagination: SwiperPagination.rect,
        ),
      ),
      // body
      Container(
        padding: EdgeInsets.only(top: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            // title and rating
            title(context, products[0]),
            // shop details features
            // detail icons
            ...detailsWidget(products[0], context),
            // title select color and capacity
            ...colorAndCapacity(products[0], context),
            //button
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.cart);
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 54,
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.addToCart,
                          style: Style.txtWhite15,
                        ),
                        const Spacer(),
                        Text(toPrice(products[0].price!),
                            style: Style.txtWhite20),
                      ],
                    ),
                  )),
            )
          ],
        ),
      )
    ]);
  }
}
