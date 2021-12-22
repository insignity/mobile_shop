import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/features/home/presentation/bloc/home_bloc.dart';

import 'home_error_page.dart';
import 'home_loaded_page.dart';
import 'home_loading_page.dart';

class HomeBlocPage extends StatelessWidget {
  const HomeBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeLoading) {
          return const HomeLoadingPage();
        } else if (state is HomeLoaded) {
          return HomeLoadedPage(
              homeStores: state.homeStores, bestSellers: state.bestSellers);
        } else if (state is HomeError) {
          return HomeErrorPage(message: state.message);
        } else {
          return HomeErrorPage(message: Strings.unexpectedErrorMessage);
        }
      }),
    );
  }
}
