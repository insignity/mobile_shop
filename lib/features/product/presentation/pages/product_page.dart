import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/core/custom_widgets/build_button.dart';
import 'package:mobile_shop/features/cart/presentation/pages/cart_page.dart';
import 'package:mobile_shop/features/home/presentation/widgets/best_seller_card.dart';
import 'package:mobile_shop/features/home/presentation/widgets/label.dart';
import 'package:mobile_shop/features/product/domain/entities/product_entity.dart';
import 'package:mobile_shop/features/product/presentation/bloc/product_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var _opacity = 0.09119112986438677;
  var _xOffset = -2.8329525353773874;
  var _yOffset = 14.931732753537744;
  var _blurRadius = 9.0396521226415;
  var _spreadRadius = 6.0512326798349045;
  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(ProductLoad());
    return Scaffold(
      body: SafeArea(child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          List<ProductEntity> products = [];
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductInitial) {
            return Center(child: Text('bloc has not got event'));
          } else if (state is ProductError) {
            return Center(
              child: Text('${state.message}'),
            );
          } else if (state is ProductLoaded) {
            products = state.products;
          }
          return ListView(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 42.0, right: 35, top: 35, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildButton(
                    context,
                    Icon(Icons.arrow_back_ios_new),
                  ),
                  const Text(
                    'Product Details',
                    style: Style.txt18,
                  ),
                  buildButton(context, Image.asset('assets/icons/bag.png'),
                      color: Clr.orange)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 941 * 349,
              child: Swiper(
                viewportFraction: 0.6,
                scale: 0.9,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, _opacity),
                          offset: Offset(_xOffset, _yOffset),
                          blurRadius: _blurRadius,
                          spreadRadius:
                              _spreadRadius, // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        products[0].images[0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                itemCount: products[0].images.length > 1
                    ? products[0].images.length
                    : 2,
                pagination: SwiperPagination.rect,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              products[0].title,
                              style: Style.txt24,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          // Stars
                          RatingBar.builder(
                            initialRating: products[0].rating,
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
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                      buildButton(context,
                          Image.asset('assets/icons/favorite_white.png'))
                    ],
                  ),
                  // shop details features
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Shop',
                              style: Style.txt20,
                            ),
                            Container(
                              width: 86,
                              decoration: const BoxDecoration(
                                  border: Border.fromBorderSide(
                                      BorderSide(color: Clr.orange))),
                            )
                          ],
                        ),
                        const Text(
                          'Details',
                          style: Style.txt20opacity50,
                        ),
                        const Text(
                          'Features',
                          style: Style.txt20opacity50,
                        ),
                      ],
                    ),
                  ),
                  // detail icons
                  Padding(
                    padding: const EdgeInsets.only(top: 33.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Image.asset('assets/icons/cpu.png'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(products[0].cpu, style: Style.txtGrey11)
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset('assets/icons/camera.png'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(products[0].camera, style: Style.txtGrey11)
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset('assets/icons/ssd.png'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(products[0].ssd, style: Style.txtGrey11)
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset('assets/icons/sd.png'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(products[0].sd, style: Style.txtGrey11)
                          ],
                        ),
                      ],
                    ),
                  ),
                  // title select color and capacity
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
                        for (var color in products[0].color)
                          Container(
                              child: color.indexOf(products[0].color.first) == 0
                                  ? Image.asset('assets/icons/ok.png')
                                  : Container(),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(
                                      int.parse('0xff' + color.substring(1))))),
                        const SizedBox(
                          width: 0,
                        ),
                        for (var capacity in products[0].capacity)
                          capacity.indexOf(products[0].capacity.first) == 0
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 54,
                          child: Row(
                            children: [
                              const Text(
                                'Add to Cart',
                                style: Style.txtWhite20,
                              ),
                              const Spacer(),
                              Text(toPrice(products[0].price),
                                  style: Style.txtWhite20),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            )

            /*  Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Column(
                  children: [
                    Slider(
                      value: _opacity,
                      min: 0.0,
                      max: 1.0,
                      onChanged: (newValue) =>
                          {setState(() => _opacity = newValue)},
                    ),
                    Slider(
                      value: _xOffset,
                      min: -100,
                      max: 100,
                      onChanged: (newValue) =>
                          {setState(() => _xOffset = newValue)},
                    ),
                    Slider(
                      value: _yOffset,
                      min: -100,
                      max: 100,
                      onChanged: (newValue) =>
                          {setState(() => _yOffset = newValue)},
                    ),
                    Slider(
                      value: _blurRadius,
                      min: 0,
                      max: 100,
                      onChanged: (newValue) =>
                          {setState(() => _blurRadius = newValue)},
                    ),
                    Slider(
                        value: _spreadRadius,
                        min: 0,
                        max: 100,
                        onChanged: (newValue) => setState(
                              () {
                                _spreadRadius = newValue;
                                print(_opacity);
                                print(_xOffset);
                                print(_yOffset);
                                print(_blurRadius);
                                print(_spreadRadius);
                              },
                            )),
                  ],
                ),
              ),
            )
        */
          ]);
        },
      )),
    );
  }
}