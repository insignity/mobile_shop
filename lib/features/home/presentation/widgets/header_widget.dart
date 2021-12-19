import 'package:flutter/material.dart';
import 'package:mobile_shop/common/style.dart';

import 'filter.dart';

Widget header(BuildContext context) {
  return Row(
    children: [
      Flexible(
        flex: 1,
        child: Container(),
      ),
      Flexible(
        flex: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/point.png'),
            const SizedBox(
              width: 11,
            ),
            const Text(
              'Zihuatanejo, Gro',
              style: Style.txt15,
            ),
            const SizedBox(
              width: 8,
            ),
            const RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.grey,
                size: 15,
              ),
            ),
          ],
        ),
      ),
      Flexible(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => filter(context),
              icon: Image.asset('assets/icons/filter.png'),
            ),
          ],
        ),
      ),
    ],
  );
}
