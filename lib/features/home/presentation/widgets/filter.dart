import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/paths.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/core/custom/build_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<dynamic> filter(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: null,
      barrierColor: Colors.white.withOpacity(0),
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Container(
          padding:
              const EdgeInsets.only(top: 24, left: 46, right: 31, bottom: 5),
          height: 320,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildButton(
                    context,
                    Image.asset(Paths.crossed),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      AppLocalizations.of(context)!.filterOptions,
                      style: Style.txt18,
                    ),
                  ),
                  buildButton(context, Text(AppLocalizations.of(context)!.done),
                      color: Clr.orange, width: 79),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              DropDownButton(
                  title: AppLocalizations.of(context)!.brand,
                  items: [
                    AppLocalizations.of(context)!.samsung,
                    AppLocalizations.of(context)!.iphone,
                  ]),
              DropDownButton(
                  title: AppLocalizations.of(context)!.price,
                  items: [
                    AppLocalizations.of(context)!.price1,
                    AppLocalizations.of(context)!.price2,
                    AppLocalizations.of(context)!.price3,
                    AppLocalizations.of(context)!.price4,
                  ]),
              DropDownButton(title: AppLocalizations.of(context)!.size, items: [
                AppLocalizations.of(context)!.size1,
                AppLocalizations.of(context)!.size2
              ]),
            ],
          ),
        );
      });
}

class DropDownButton extends StatefulWidget {
  String title;
  List<String> items;
  DropDownButton({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  var selectedItem;
  @override
  void initState() {
    selectedItem = widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Style.txt18,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 37,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFFDCDCDC), width: 1)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedItem,
              isExpanded: true,
              icon: const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue;
                });
              },
              items: [
                for (var text in widget.items)
                  DropdownMenuItem<String>(
                    value: text,
                    child: Text(text, style: Style.txt18),
                  ),
              ],
              selectedItemBuilder: (BuildContext context) {
                return widget.items.map<Widget>((String item) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                    child: Text(
                      item,
                      style: Style.txt18,
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ],
    );
  }
}
