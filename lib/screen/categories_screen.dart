import 'package:flutter/material.dart';
import '../widget/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  static const routeName = "categories-screen";

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((x) => CategoryItem(
                x.id,
                x.title,
                x.color,
              ))
          .toList(),
    );
  }
}
