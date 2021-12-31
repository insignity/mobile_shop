import 'package:flutter/material.dart';
import 'package:mobile_shop/features/product/presentation/pages/product_error_page.dart';
import 'package:mobile_shop/features/product/presentation/pages/product_loaded_page.dart';
import 'package:mobile_shop/features/product/presentation/pages/product_loading_page.dart';
import 'package:mobile_shop/features/product/presentation/redux/actions.dart';
import 'package:redux/redux.dart';
import 'app_state.dart';

AppState productReducer(AppState state, dynamic action) =>
    AppState(widget: _productReducer(state.widget, action));

Reducer<Widget> _productReducer = combineReducers([
  TypedReducer(_loadingProductsReducer),
  TypedReducer(_loadedProductsReducer),
  TypedReducer(_errorProductsReducer),
]);

Widget _loadingProductsReducer(Widget widget, ProductLoadingAction action) =>
    const ProductLoadingPage();

Widget _loadedProductsReducer(Widget widget, ProductLoadedAction action) =>
    ProductLoadedPage(product: action.product);

Widget _errorProductsReducer(Widget widget, ProductErrorAction action) =>
    ProductErrorPage(message: action.message);
