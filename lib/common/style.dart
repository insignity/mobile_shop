import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';

class Style {
  static ThemeData themeData = ThemeData(
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
  );

  static const txt35 = TextStyle(
      fontSize: 35,
      color: Clr.darkBlue,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txt25 = TextStyle(
      fontSize: 25,
      color: Clr.darkBlue,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txtWhite25 = TextStyle(
      fontSize: 25,
      color: Colors.white,
      letterSpacing: -0.33,
      fontWeight: FontWeight.w700);

  static const txt24 = TextStyle(
      fontSize: 24,
      letterSpacing: -0.33,
      color: Clr.darkBlue,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w500);

  static const txt18 = TextStyle(
      fontSize: 18,
      color: Clr.darkBlue,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txtWhite20 = TextStyle(
      fontSize: 20,
      color: Colors.white,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txtOrange20w500 = TextStyle(
      fontSize: 20,
      color: Clr.orange,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txtWhite20w500 = TextStyle(
      fontSize: 20,
      color: Colors.white,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txt20 = TextStyle(
      fontSize: 20,
      color: Clr.darkBlue,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txt20opacity50 = TextStyle(
      fontSize: 20,
      color: Color(0x80000000),
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w400);

  static const txt15 = TextStyle(
      fontSize: 15,
      color: Clr.darkBlue,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txt16 = TextStyle(
      fontSize: 16,
      color: Clr.darkBlue,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txt16w500 = TextStyle(
      fontSize: 16,
      color: Clr.darkBlue,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w500);

  static const txtOrange15 = TextStyle(
      fontSize: 15,
      color: Clr.orange,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w700);

  static const txtWhite15 = TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontFamily: 'MarkPro',
      letterSpacing: -0.33,
      fontWeight: FontWeight.w700);

  static const txtWhite15w400 = TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontFamily: 'MarkPro',
      letterSpacing: -0.33,
      fontWeight: FontWeight.w400);

  static const txtWhite13 = TextStyle(
      fontSize: 13,
      color: Colors.white,
      fontFamily: 'MarkPro',
      letterSpacing: -0.33,
      fontWeight: FontWeight.w700);

  static const txtDarkGrey13 = TextStyle(
      fontSize: 13,
      color: Clr.darkGrey,
      fontFamily: 'MarkPro',
      letterSpacing: -0.33,
      fontWeight: FontWeight.w700);

  static const txtOrange12 = TextStyle(
      fontSize: 12,
      color: Clr.orange,
      fontFamily: 'MarkPro',
      letterSpacing: -0.33,
      fontWeight: FontWeight.w700);

  static const txt12 = TextStyle(
      fontSize: 12,
      color: Clr.darkBlue,
      fontFamily: 'MarkPro',
      letterSpacing: -0.33,
      fontWeight: FontWeight.w700);

  static const txt12opacity50 = TextStyle(
      fontSize: 12,
      color: Clr.darkBlueOpacity50,
      fontFamily: 'MarkPro',
      letterSpacing: -0.33,
      fontWeight: FontWeight.w700);

  static const txt11 = TextStyle(
      fontSize: 11,
      color: Clr.darkBlue,
      letterSpacing: -0.33,
      fontWeight: FontWeight.w700);

  static const txtGrey11 = TextStyle(
      fontSize: 11,
      color: Clr.grey,
      letterSpacing: -0.33,
      fontWeight: FontWeight.w400);

  static const txtWhite11 = TextStyle(
      fontSize: 11,
      color: Colors.white,
      letterSpacing: -0.33,
      fontWeight: FontWeight.w700);

  static const txt10crossed = TextStyle(
      decoration: TextDecoration.lineThrough,
      fontSize: 10,
      color: Clr.grey,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w500);

  static const txt10 = TextStyle(
      fontSize: 10,
      color: Clr.darkBlue,
      letterSpacing: -0.33,
      fontFamily: 'MarkPro',
      fontWeight: FontWeight.w400);
}
