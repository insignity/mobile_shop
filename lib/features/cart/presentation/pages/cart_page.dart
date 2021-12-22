import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/cart/domain/entities/cart_entity.dart';
import 'package:mobile_shop/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:mobile_shop/features/cart/presentation/widgets/body_widget.dart';
import 'package:mobile_shop/features/cart/presentation/widgets/header_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(CartLoad());
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        CartEntity cart =
            CartEntity(id: '', basket: [], total: 0, delivery: '');
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
          throw UnimplementedError(Strings.unexpectedErrorMessage);
        }
        return SafeArea(
          child: Scaffold(
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const HeaderWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 20, bottom: 45),
                child: Text(
                  AppLocalizations.of(context)!.myCart,
                  style: Style.txt35,
                ),
              ),
              BodyWidget(cart: cart)
            ]),
          ),
        );
      },
    );
  }
}
