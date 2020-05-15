import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';
import './screen/filters_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/tabs_screen.dart';
import './screen/categories_meal_screen.dart';
import './screen/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Map<String, bool> filterData = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };

  List<Meal> dataMeals = DUMMY_MEALS;
  List<String> listMealFavorite = [];

  // function untuk memfilter jenis meal
  void setFilter(Map<String, bool> setdata) {
    setState(() {
      filterData['isGlutenFree'] = setdata['isGlutenFree'];
      filterData['isVegan'] = setdata['isVegan'];
      filterData['isVegetarian'] = setdata['isVegetarian'];
      filterData['isLactoseFree'] = setdata['isLactoseFree'];
    });
    dataMeals = DUMMY_MEALS.where(
      (dataMeal) {
        if (filterData['isGlutenFree']) {
          if (!dataMeal.isGlutenFree) {
            return false;
          }
        }
        if (filterData['isVegan']) {
          if (!dataMeal.isVegan) {
            return false;
          }
        }
        if (filterData['isVegetarian']) {
          if (!dataMeal.isVegetarian) {
            return false;
          }
        }
        if (filterData['isLactoseFree']) {
          if (!dataMeal.isLactoseFree) {
            return false;
          }
        }
        return true;
      },
    ).toList();
  }

  void setIdMealFavorite(String idMeal) {
    var count = listMealFavorite.where((data) => data == idMeal).toList();
    if (count.length > 0) {
      listMealFavorite.removeWhere((data) => data == idMeal);
    } else {
      listMealFavorite.add(idMeal);
    }
  }

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
      initialRoute: '/', // untuk default home route
      routes: {
        '/': (ctx) => TabsScreen(listMealFavorite),
        CategoriesMeal.routeName: (ctx) => CategoriesMeal(dataMeals),
        MealDetailSceen.routeName: (ctx) => MealDetailSceen(setIdMealFavorite, listMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filterData, setFilter),
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
