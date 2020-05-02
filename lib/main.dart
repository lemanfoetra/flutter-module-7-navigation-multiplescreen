import 'package:flutter/material.dart';
import './screen/filters_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/tabs_screen.dart';
import './screen/categories_meal_screen.dart';
import './screen/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: Home(),
      initialRoute: '/', // untuk default home route
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoriesMeal.routeName: (ctx) => CategoriesMeal(),
        MealDetailSceen.routeName: (ctx) => MealDetailSceen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },

      onGenerateRoute: (setting) {
        // if(setting.name == 'the route name'){
        //   return a widget;
        // }
      },

      /*
        Callback ini biasanya digunakan untuk penanganan kesalahan. Misalnya, panggilan balik ini mungkin selalu menghasilkan halaman "tidak ditemukan" yang menjelaskan rute yang tidak ditemukan. Atau seperti halaman 404 kalo web
      */
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
