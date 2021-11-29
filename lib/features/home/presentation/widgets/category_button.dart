import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';

Widget categoryButton(String name, String image, bool isActive) {
  return Column(
    children: [
      Container(
        height: 71,
        width: 71,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Clr.orange : Colors.white,
        ),
        child: Image.asset(
          image,
          color: isActive ? Colors.white : null,
        ),
      ),
      Text(
        name,
        style: isActive ? Style.txtOrange12 : Style.txt12,
      )
    ],
  );
}
