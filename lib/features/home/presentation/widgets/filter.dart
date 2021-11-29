import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';
import 'package:mobile_shop/common/style.dart';
import 'package:mobile_shop/core/custom_widgets/build_button.dart';

Future<dynamic> filter(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: null,
      barrierColor: Colors.white.withOpacity(0),
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 24, left: 46, right: 31),
          height: 300,
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
                    Image.asset('assets/icons/crossed.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Filter options',
                      style: Style.txt18,
                    ),
                  ),
                  buildButton(context, const Text('Done'),
                      color: Clr.orange, width: 79),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              DropDownButton(title: 'Brand', items: [
                'Samsung',
                'Iphone',
              ]),
              DropDownButton(title: 'Price', items: [
                '\$0 - \$300',
                '\$300 - \$500',
                '\$500 - \$2000',
                '\$2000 - \$10000',
              ]),
              DropDownButton(
                  title: 'Size',
                  items: ['4.5 to 5.5 inches', '5.6 to 6.5 inches']),
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
