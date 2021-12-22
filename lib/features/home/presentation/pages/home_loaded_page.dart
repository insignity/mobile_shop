import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/paths.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';
import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';
import 'package:mobile_shop/features/home/presentation/widgets/best_seller_card.dart';
import 'package:mobile_shop/features/home/presentation/widgets/categories.dart';
import 'package:mobile_shop/features/home/presentation/widgets/header_widget.dart';
import 'package:mobile_shop/features/home/presentation/widgets/hot_sales.dart';
import 'package:mobile_shop/features/home/presentation/widgets/label.dart';
import 'package:mobile_shop/features/product/presentation/pages/product_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLoadedPage extends StatelessWidget {
  final List<HomeStoreEntity> homeStores;
  final List<BestSellerEntity> bestSellers;

  const HomeLoadedPage(
      {Key? key, required this.homeStores, required this.bestSellers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.fromLTRB(17.0, 17.0, 17.0, 0),
        child: ListView(children: [
          Column(
            children: [
              // Header
              header(context),
              // Select Category Title
              label(AppLocalizations.of(context)!.selectCategory,
                  AppLocalizations.of(context)!.viewAll, () {}),
              // Select Category ListView
              Categories(),
              // Search
              Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: TextFormField(
                        autocorrect: false,
                        style: Style.txt12,
                        decoration: InputDecoration(
                          icon: const Padding(
                            padding: EdgeInsets.only(left: 24.0),
                            child: Icon(
                              Icons.search,
                              color: Clr.orange,
                            ),
                          ),
                          contentPadding: const EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          hintText: AppLocalizations.of(context)!.search,
                          hintStyle: Style.txt12opacity50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Container(
                      height: 34,
                      width: 34,
                      decoration: const BoxDecoration(
                          color: Clr.orange, shape: BoxShape.circle),
                      child: Image.asset(Paths.qr))
                ],
              ),
              // Hot Sales
              label(AppLocalizations.of(context)!.hotSales,
                  AppLocalizations.of(context)!.seeMore, () {}),
              CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: true, height: width / 2, viewportFraction: 1),
                  itemBuilder: (context, index, realIndex) {
                    return hotSales(homeStores[index], context);
                  },
                  itemCount: homeStores.length),
              // Best Seller
              label(AppLocalizations.of(context)!.bestSeller,
                  AppLocalizations.of(context)!.seeMore, () {}),
              Container(
                height: width * 1.15,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 181 / 227,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 14,
                  children: [
                    for (var index in bestSellers)
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductPage()));
                          },
                          child: bestSellerCard(index))
                  ],
                  crossAxisCount: 2,
                ),
              ),
            ],
          ),
        ]));
  }
}
