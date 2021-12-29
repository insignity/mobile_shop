import 'package:flutter/material.dart';

class ProductErrorPage extends StatelessWidget {
  String message;
  ProductErrorPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
