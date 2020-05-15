import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> displayingMeal;


  FavoritesScreen(this.displayingMeal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: displayingMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayingMeal[index].id,
            title: displayingMeal[index].title,
            imgUrl: displayingMeal[index].imageUrl,
            duration: displayingMeal[index].duration,
            complexity: displayingMeal[index].complexity,
            affordability: displayingMeal[index].affordability,
          );
        },
      ),
    );
  }
}