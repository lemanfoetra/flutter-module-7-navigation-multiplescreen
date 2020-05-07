import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../models/meal.dart';

class CategoriesMeal extends StatefulWidget {

  static const routeName = "/categories-meal-screen";
  final List<Meal> dataMeals;

  CategoriesMeal(this.dataMeals);
  @override
  _CategoriesMealState createState() => _CategoriesMealState();
}

class _CategoriesMealState extends State<CategoriesMeal> {

  
  List<Meal> displayingMeal;
  String titleMeal;
  bool _initLoadedData = true;
  


  // funtion ini dipanggil ketika dependencies berubah
  // kenapa script ini dimasukan kesini, karena untuk mengambil passing data membutuhkan "context" dan itu hanya bisa di dapatkan dari funtion cycle nya flutter
  @override
  void didChangeDependencies() {

    if (_initLoadedData) {

      var routeData = ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String id = routeData['id'];
      titleMeal = routeData['title'];
      displayingMeal = widget.dataMeals.where((dataMeal) {
        for (int i = 0; i < dataMeal.categories.length; i++) {
          if (dataMeal.categories[i] == id) {
            return true;
          }
        }
        return false;
      }).toList();

      _initLoadedData = false;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleMeal),
      ),
      body: ListView.builder(
        itemCount: displayingMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayingMeal[index].id,
            title: displayingMeal[index].title,
            imgUrl: displayingMeal[index].imageUrl,
            duration: displayingMeal[index].duration,
            complexity: displayingMeal[index].complexity,
            affordability: displayingMeal[index].affordability,
            deleteMeal: _deleteMeal,
          );
        },
      ),
    );
  }

  void _deleteMeal(String mealId) {
    setState(() {
      displayingMeal.removeWhere((data) {
        return data.id == mealId;
      });
    });
  }
}
