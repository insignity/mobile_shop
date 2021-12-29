import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile_shop/features/product/presentation/redux/app_state.dart';

class ProductReduxPage extends StatelessWidget {
  const ProductReduxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, viewModel) => viewModel.widget),
      ),
    );
  }
}
