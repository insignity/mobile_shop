import 'package:flutter/material.dart';
import 'package:mobile_shop/common/style.dart';

Widget label(String name, String textButtonName, Function textButtonFunction) {
  return Row(
    children: [
      Text(
        name,
        style: Style.txt25,
      ),
      const Spacer(),
      TextButton(
          onPressed: () => textButtonFunction,
          child: Text(
            textButtonName,
            style: Style.txtOrange15,
          ))
    ],
  );
}
