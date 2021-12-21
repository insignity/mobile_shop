import 'package:flutter/material.dart';

class HomeLoadingPage extends StatelessWidget {
  const HomeLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
