import 'package:flutter/material.dart';
import 'package:meals/widget/meal_item.dart';
import '../dummy_data.dart';

class CategoriesMeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routeData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeData['id'];
    final String title = routeData['title'];
    final idCategoryMeal = DUMMY_MEALS.where((dataMeal) {
      for (int i = 0; i < dataMeal.categories.length; i++) {
        if (dataMeal.categories[i] == id) {
          return true;
        }
      }
      return false;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: idCategoryMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            title: idCategoryMeal[index].title,
            imgUrl: idCategoryMeal[index].imageUrl,
            duration: idCategoryMeal[index].duration,
            complexity: idCategoryMeal[index].complexity,
            affordability: idCategoryMeal[index].affordability,
          );
        },
      ),
    );
  }
}
