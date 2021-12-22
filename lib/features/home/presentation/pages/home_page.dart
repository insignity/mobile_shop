import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/common/paths.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/home/presentation/bloc/home_bloc.dart';
import 'package:mobile_shop/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:mobile_shop/features/home/presentation/widgets/firebase.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  var list = [
    const HomeBlocPage(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
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
            Text(
              AppLocalizations.of(context)!.explorer,
              style: Style.txtWhite15,
            )
          ],
        ),
      ),
      CustomBottomNavBarItem(
        icon: Image.asset(Paths.bag),
      ),
      CustomBottomNavBarItem(
        icon: Image.asset(Paths.favoriteWhite),
      ),
      CustomBottomNavBarItem(
        icon: Image.asset(
          Paths.person,
        ),
      ),
    ];

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
