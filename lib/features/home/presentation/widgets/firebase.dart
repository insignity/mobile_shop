import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../../main.dart';

class FirebaseSettings {
  FirebaseOptions firebaseOptions = const FirebaseOptions(
    apiKey: 'AIzaSyD48NkXB1nWeWOQl403Uo0V-_NZwusug3w',
    appId: '1:878058969731:android:936ff80bc900230c1f19b6',
    messagingSenderId: '878058969731',
    projectId: 'mobile-shop-21a1e',
  );

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  initMessaging() async {
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
    getToken();
  }

  listen(BuildContext context) => FirebaseMessaging.onMessageOpenedApp
      .listen((message) => Navigator.pushNamed(context, '/product'));
  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('token is ' + token.toString());
  }
}
