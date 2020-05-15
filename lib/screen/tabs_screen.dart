import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widget/my_drawer.dart';
import './FavoritesScreen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';
  final List<String> listFavoriteMeal;

  TabsScreen(this.listFavoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Meal> listFavoriteMeal = [];
  List<Map<String, Object>> _listScreen = [];
  int _indexScreen = 0;

  void onSelect(int index) {
    setState(() {
      _indexScreen = index;
    });
  }




  @override
  void initState() {
    setState(() {
      _listScreen = [
        {
          'page': CategoriesScreen(),
          'title': 'Categories',
        },
        {
          'page': FavoritesScreen(listFavoriteMeal),
          'title': 'Your Favorites',
        },
      ];

      for (int i = 0; i < widget.listFavoriteMeal.length; i++) {
        List<Meal> meal = DUMMY_MEALS
            .where((data) => data.id == widget.listFavoriteMeal[i])
            .toList();
        if (meal.length > 0) {
          for (int j = 0; j < meal.length; j++) {
            listFavoriteMeal.add(meal[j]);
          }
        }
      }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_listScreen[_indexScreen]['title']),
      ),
      body: _listScreen[_indexScreen]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexTab) {
          return onSelect(indexTab);
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _indexScreen,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
