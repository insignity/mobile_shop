import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobile_shop/common/routes.dart';
import 'package:mobile_shop/common/strings.dart';
import 'package:mobile_shop/features/home/presentation/pages/home_error_page.dart';

class FirebaseSettings {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  FirebaseOptions firebaseOptions = const FirebaseOptions(
    apiKey: Strings.apiKey,
    appId: Strings.appId,
    messagingSenderId: Strings.messagingSenderId,
    projectId: Strings.projectId,
  );

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    Strings.channelId, // id
    Strings.channelTitle, // title
    description: Strings.channelDescription, // description
    importance: Importance.high,
  );

  initMessaging() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(FirebaseSettings.channel);

    FirebaseMessaging.instance.getInitialMessage();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings(Strings.iconPath);
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
    getToken();
  }

  Future firebaseMessagingBackgroundHandler(RemoteMessage message) async {
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

  listen(BuildContext context) => FirebaseMessaging.onMessageOpenedApp
      .listen((message) => Navigator.pushNamed(context, Routes.product));
  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token.toString());
  }

  deeplink(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      Navigator.pushNamed(context, dynamicLinkData.link.path);
    }).onError((error) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeErrorPage(
                    message: Strings.wrongDeeplink,
                  )));
    });
  }
}
