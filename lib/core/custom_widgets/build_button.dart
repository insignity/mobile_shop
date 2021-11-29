import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';

Widget buildButton(BuildContext context, Widget child,
    {Color? color, double? height, double? width, Function()? onPressed}) {
  return Center(
    child: SizedBox(
        width: width ?? 37,
        height: height ?? 37,
        child: ElevatedButton(
          child: child,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
              backgroundColor:
                  MaterialStateProperty.all(color ?? Clr.darkBlue)),
          onPressed: onPressed ??
              () {
                Navigator.pop(context);
              },
        )),
  );
}
