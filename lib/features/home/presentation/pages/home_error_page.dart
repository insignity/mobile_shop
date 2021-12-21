import 'package:flutter/material.dart';

class HomeErrorPage extends StatelessWidget {
  String message;
  HomeErrorPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
