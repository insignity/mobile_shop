import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/features/home/domain/entities/best_seller_entity.dart';
import 'package:mobile_shop/features/home/domain/entities/home_store_entity.dart';
import 'package:mobile_shop/features/home/presentation/bloc/home_bloc.dart';
import 'package:mobile_shop/features/home/presentation/widgets/categories.dart';
import 'package:mobile_shop/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:mobile_shop/features/home/presentation/widgets/filter.dart';
import 'package:mobile_shop/features/home/presentation/widgets/header_widget.dart';
import 'package:mobile_shop/features/home/presentation/widgets/hot_sales.dart';
import 'package:mobile_shop/features/home/presentation/widgets/label.dart';
import 'package:mobile_shop/features/home/presentation/widgets/best_seller_card.dart';
import 'package:mobile_shop/features/product/presentation/pages/product_page.dart';
import 'package:mobile_shop/main.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      Navigator.pushNamed(context, '/product');
    });
  }

  int activeCategory = 0;
  String dropDownButton = "data";
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeLoad());

    return Scaffold(
      bottomNavigationBar: CustomNavBarWidget(
        selectedIndex: currentIndex,
        items: [
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
        ],
        onItemSelected: (int value) {
          currentIndex = value;
          setState(() {});
        },
      ),
      body: body(context, currentIndex),
    );
  }

  Widget body(BuildContext context, int currentIndex) {
    double width = MediaQuery.of(context).size.width;
    var list = [
      Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              List<BestSellerEntity> bestSellers = [];
              List<HomeStoreEntity> homeStore = [];
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeLoaded) {
                bestSellers = state.bestSellers;
                homeStore = state.homeStores;
              } else if (state is HomeError) {
                return Text(state.message);
              }
              return Padding(
                  padding: const EdgeInsets.fromLTRB(17.0, 17.0, 17.0, 0),
                  child: ListView(children: [
                    Column(
                      children: [
                        // Header
                        header(context),
                        // Select Category Title
                        label('Select Category', 'view all', () {}),
                        // Select Category ListView
                        Categories(),
                        // Search
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: TextFormField(
                                  autocorrect: false,
                                  style: Style.txt12,
                                  decoration: const InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Icon(
                                        Icons.search,
                                        color: Clr.orange,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 10),
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: Style.txt12opacity50,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 11),
                            Container(
                                height: 34,
                                width: 34,
                                decoration: const BoxDecoration(
                                    color: Clr.orange, shape: BoxShape.circle),
                                child: Image.asset('assets/icons/qr.png'))
                          ],
                        ),
                        // Hot Sales
                        label('Hot Sales', 'see more', () {}),
                        CarouselSlider.builder(
                            options: CarouselOptions(
                                autoPlay: true,
                                height: width / 2,
                                viewportFraction: 1),
                            itemBuilder: (context, index, realIndex) {
                              return hotSales(homeStore[index]);
                            },
                            itemCount: homeStore.length),
                        // Best Seller
                        label('Best Seller', 'see more', () {}),
                        Container(
                          height: width * 1.15,
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 181 / 227,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 14,
                            children: [
                              for (var index in bestSellers)
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductPage()));
                                    },
                                    child: bestSellerCard(index))
                            ],
                            crossAxisCount: 2,
                          ),
                        ),
                      ],
                    ),
                  ]));
            },
          ),
        ),
      ),
      Container(),
      Container(),
      Container(),
    ];

    return list[currentIndex];
  }
}
