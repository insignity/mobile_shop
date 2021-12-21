import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/features/home/presentation/pages/home_page.dart';
import 'package:mobile_shop/features/home/presentation/widgets/firebase.dart';
import 'package:mobile_shop/features/product/presentation/bloc/product_bloc.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/cart/presentation/pages/cart_page.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/pages/home_map.dart';
import 'features/product/presentation/pages/product_page.dart';
import 'locator_service.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  flutterLocalNotificationsPlugin.show(
    message.hashCode,
    message.notification?.title,
    message.notification?.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        FirebaseSettings.channel.id,
        FirebaseSettings.channel.name,
        channelDescription: FirebaseSettings.channel.description,
        icon: message.notification?.android?.smallIcon,
      ),
    ),
  );
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Firebase.initializeApp(options: FirebaseSettings().firebaseOptions);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(FirebaseSettings.channel);

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://my-awesome-app.page.link',
    link: Uri.parse('https://my-awesome-app.page.link/cart'),
  );

  final Uri uri = await dynamicLinks.buildLink(parameters);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ProductBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<CartBloc>(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => HomePage(),
          '/product': (context) => const ProductPage(),
          '/cart': (context) => const CartPage(),
          '/home/map': (context) => const HomeMap(),
        },
        initialRoute: '/',
        title: 'Flutter Demo',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 38)),
                  backgroundColor: MaterialStateProperty.all(Clr.orange))),
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
