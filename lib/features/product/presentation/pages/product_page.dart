import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile_shop/features/product/presentation/pages/product_redux_page.dart';
import 'package:mobile_shop/features/product/presentation/redux/actions.dart';
import 'package:mobile_shop/features/product/presentation/redux/app_state.dart';
import 'package:mobile_shop/features/product/presentation/redux/middlewares.dart';
import 'package:mobile_shop/features/product/presentation/redux/reducers.dart';
import 'package:redux/redux.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Store<AppState> store = Store(productReducer,
        middleware: [ProductMiddleware()],
        initialState: AppState(widget: Container()));
    store.dispatch(ProductLoadingAction());
    return StoreProvider(store: store, child: const ProductReduxPage());
  }
}
