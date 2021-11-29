import 'package:flutter/material.dart';

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
                'Phones',
                'assets/icons/smartphone.png',
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
              'Computers',
              'assets/icons/computer.png',
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
              'Health',
              'assets/icons/health.png',
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
              'Books',
              'assets/icons/books.png',
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
              'Category',
              'assets/icons/smartphone.png',
              activeCategory == 4,
            ),
          ),
        ],
      ),
    );
  }
}
