import 'package:flutter/material.dart';

import 'categories_fragment.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;

  CategoryWidget(this.category, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 148,
      decoration: index == 0 || index == 2 || index == 4
          ? // or leftbottom(index%2==0? 0:18) as a example
          BoxDecoration(
              color: category.color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18)))
          : BoxDecoration(
              color: category.color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 8),
            child: Image.asset(
              'assets/images/${category.imageName}.png',
              height: 100,
              width: 100,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            category.title,
            style: TextStyle(fontSize: 22, color: Colors.white),
          )
        ],
      ),
    );
  }
}
