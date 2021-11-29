import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/common/clr.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<CustomBottomNavBarItem>
      items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildItem(CustomBottomNavBarItem item, bool isSelected) {
    return Container(
      height: 72,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorSecondary == null
                          ? item.activeColorPrimary
                          : item.activeColorSecondary)
                      : item.inactiveColorPrimary == null
                          ? item.activeColorPrimary
                          : item.inactiveColorPrimary),
              child: item.icon ?? Container(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: Clr.darkBlue, borderRadius: BorderRadius.circular(30)),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          int index = items.indexOf(item);
          return Flexible(
            child: GestureDetector(
              onTap: () {
                this.onItemSelected(index);
              },
              child: _buildItem(item, selectedIndex == index),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavBarItem {
  Widget? icon;
  Widget? inactiveIcon;
  Color activeColorPrimary;
  Color? inactiveColorPrimary;
  Color? activeColorSecondary;
  Color inactiveColorSecondary;
  double contentPadding;
  double opacity;
  Function(BuildContext?)? onPressed;
  Function? onSelectedTabPressWhenNoScreensPushed;
  ImageFilter? filter;
  TextStyle? textStyle;
  double iconSize;
  CustomBottomNavBarItem(
      {this.icon,
      this.inactiveIcon,
      this.contentPadding = 5.0,
      this.activeColorPrimary = CupertinoColors.activeBlue,
      this.activeColorSecondary,
      this.inactiveColorPrimary,
      this.inactiveColorSecondary = CupertinoColors.systemGrey,
      this.opacity = 1.0,
      this.filter,
      this.textStyle,
      this.iconSize = 26.0,
      this.onSelectedTabPressWhenNoScreensPushed,
      this.onPressed}) {
    assert(opacity >= 0 && opacity <= 1.0);
  }
}
