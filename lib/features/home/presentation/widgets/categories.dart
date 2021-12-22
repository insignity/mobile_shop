import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_shop/common/paths.dart';
import 'category_button.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int activeCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
              child: categoryButton(
                AppLocalizations.of(context)!.phones,
                Paths.smartphone,
                activeCategory == 0,
              ),
              onTap: () {
                setState(() {
                  activeCategory = 0;
                });
              }),
          const SizedBox(
            width: 23,
          ),
          InkWell(
            child: categoryButton(
              AppLocalizations.of(context)!.computers,
              Paths.computer,
              activeCategory == 1,
            ),
            onTap: () {
              setState(() {
                activeCategory = 1;
              });
            },
          ),
          const SizedBox(
            width: 23,
          ),
          InkWell(
            onTap: () {
              setState(() {
                activeCategory = 2;
              });
            },
            child: categoryButton(
              AppLocalizations.of(context)!.health,
              Paths.health,
              activeCategory == 2,
            ),
          ),
          const SizedBox(
            width: 23,
          ),
          InkWell(
            onTap: () {
              setState(() {
                activeCategory = 3;
              });
            },
            child: categoryButton(
              AppLocalizations.of(context)!.books,
              Paths.books,
              activeCategory == 3,
            ),
          ),
          const SizedBox(
            width: 23,
          ),
          InkWell(
            onTap: () {
              setState(() {
                activeCategory = 4;
              });
            },
            child: categoryButton(
              AppLocalizations.of(context)!.category,
              Paths.smartphone,
              activeCategory == 4,
            ),
          ),
        ],
      ),
    );
  }
}
