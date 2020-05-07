import 'package:flutter/material.dart';
import 'package:meals/widget/my_drawer.dart';
import './FavoritesScreen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {

  static const routeName = '/';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}


class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _listScreen = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorites',
    },
  ];

  int _indexScreen = 0;

  void onSelect(int index) {
    setState(() {
      _indexScreen = index;
    });
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
