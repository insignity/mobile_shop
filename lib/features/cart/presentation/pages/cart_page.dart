import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/core/custom_widgets/build_button.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobile_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:mobile_shop/features/home/presentation/widgets/best_seller_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(CartLoad());
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        CartEntity? cart;
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartLoaded) {
          cart = state.cartEntity;
        } else if (state is CartInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartError) {
          throw UnimplementedError('unimplemented error');
        }
        return SafeArea(
          child: Scaffold(
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    Spacer(),
                    const Text(
                      'Add address',
                      style: Style.txt18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildButton(
                        context, Image.asset('assets/icons/location_point.png'),
                        color: Clr.orange)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0, top: 20, bottom: 45),
                child: Text(
                  'My Cart',
                  style: Style.txt35,
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Clr.darkBlue,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Container(
                      height: 280,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 23, top: 60),
                        child: ListView.builder(
                          itemCount: cart!.basket.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 88,
                                  width: 88,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      cart!.basket.first.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 150,
                                      child: Text(cart.basket.first.title,
                                          style: Style.txtWhite20w500,
                                          maxLines: 2),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Container(
                                      width: 150,
                                      child: Text(
                                        '\$' +
                                            cart.basket.first.price.toString() +
                                            '.00',
                                        style: Style.txtOrange20w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 33,
                                ),
                                Container(
                                  width: 26,
                                  decoration: BoxDecoration(
                                      color: Color(0xff282843),
                                      borderRadius: BorderRadius.circular(26)),
                                  child: Column(
                                    children: [
                                      const Text(
                                        '-',
                                        style: Style.txtWhite20w500,
                                      ),
                                      Text(
                                        cart.basket.length.toString(),
                                        style: Style.txtWhite20w500,
                                      ),
                                      const Text(
                                        '+',
                                        style: Style.txtWhite20w500,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 17,
                                ),
                                SizedBox(
                                    width: 20,
                                    child:
                                        Image.asset('assets/icons/trash.png'))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white.withAlpha(66),
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 55.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: Style.txtWhite15w400,
                              ),
                              Text(
                                'Delivery',
                                style: Style.txtWhite15w400,
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                toPrice(cart.total) + ' us',
                                style: Style.txtWhite15,
                              ),
                              Text(
                                cart.delivery,
                                style: Style.txtWhite15,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white.withAlpha(66),
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            height: 54,
                            child: Center(
                              child: const Text(
                                'Checkout',
                                style: Style.txtWhite20,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ))
            ]),
          ),
        );
      },
    );
  }
}
