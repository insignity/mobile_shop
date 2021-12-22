import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/paths.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/core/custom/build_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          Text(
            AppLocalizations.of(context)!.addAddress,
            style: Style.txt18,
          ),
          const SizedBox(
            width: 10,
          ),
          buildButton(context, Image.asset(Paths.locationPoint),
              color: Clr.orange)
        ],
      ),
    );
  }
}
