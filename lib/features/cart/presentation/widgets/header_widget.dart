import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/core/custom_widgets/build_button.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 42.0, right: 35, top: 35, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildButton(
            context,
            Icon(Icons.arrow_back_ios_new),
          ),
          Spacer(),
          const Text(
            'Add address',
            style: Style.txt18,
          ),
          const SizedBox(
            width: 10,
          ),
          buildButton(context, Image.asset('assets/icons/location_point.png'),
              color: Clr.orange)
        ],
      ),
    );
  }
}
