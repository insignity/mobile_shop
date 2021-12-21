import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/home/presentation/bloc/home_bloc.dart';
import 'package:mobile_shop/features/home/presentation/pages/home_error_page.dart';
import 'package:mobile_shop/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:mobile_shop/features/home/presentation/widgets/firebase.dart';

import 'home_bloc_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseSettings().initMessaging();
    FirebaseSettings().listen(context);
    FirebaseSettings().deeplink(context);
  }

  int currentIndex = 0;
  var bottomNavigationBarItems = [
    CustomBottomNavBarItem(
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            height: 8,
            width: 8,
          ),
          const SizedBox(width: 7),
          const Text(
            'Explorer',
            style: Style.txtWhite15,
          )
        ],
      ),
    ),
    CustomBottomNavBarItem(
      icon: Image.asset('assets/icons/bag.png'),
    ),
    CustomBottomNavBarItem(
      icon: Image.asset('assets/icons/favorite_white.png'),
    ),
    CustomBottomNavBarItem(
      icon: Image.asset(
        'assets/icons/person.png',
      ),
    ),
  ];
  var list = [
    const HomeBlocPage(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeLoad());

    return Scaffold(
      bottomNavigationBar: CustomNavBarWidget(
        selectedIndex: currentIndex,
        items: bottomNavigationBarItems,
        onItemSelected: (int value) {
          currentIndex = value;
          setState(() {});
        },
      ),
      body: list[currentIndex],
    );
  }
}
