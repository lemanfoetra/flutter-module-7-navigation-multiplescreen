import 'package:flutter/material.dart';
import 'dummy_data.dart';

class CategoriesMeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routeData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeData['id'];
    final String title = routeData['title'];
    final idCategoryMeal = DUMMY_MEALS.where((dataMeal) {
      
      for(int i = 0; i < dataMeal.categories.length; i++){
        if(dataMeal.categories[i] == id){
          return true;
        }
      }
      return false;
      //return dataMeal.categories.contains(id); // contains() juba berfungsi untuk memriksa sama atau tidaknya
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: idCategoryMeal.length,
        itemBuilder: (ctx, index) {
          return Text(idCategoryMeal[index].title);
        },
      ),
    );
  }
}
