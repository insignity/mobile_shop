import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_shop/common/routes.dart';
import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/features/home/presentation/widgets/firebase.dart';
import 'package:mobile_shop/features/product/presentation/bloc/product_bloc.dart';
import 'common/style.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'locator_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseSettings().flutterLocalNotificationsPlugin.show(
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocatorInit();
  await Firebase.initializeApp(options: FirebaseSettings().firebaseOptions);
  await FirebaseSettings().initMessaging();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale(Strings.en),
          Locale(Strings.ru),
        ],
        routes: Routes.routes,
        initialRoute: Routes.home,
        theme: Style.themeData,
      ),
    );
  }
}
