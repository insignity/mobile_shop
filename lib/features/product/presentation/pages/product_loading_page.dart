import 'package:flutter/material.dart';

class ProductLoadingPage extends StatelessWidget {
  const ProductLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
