import 'package:flutter/material.dart';
import 'package:meals/screen/FavoritesScreen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (ctx, innerBoxIsScrollable) {
            return <Widget>[
              SliverAppBar(
                title: Text('Meals'),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.category),
                      text: 'Categories',
                    ),
                    Tab(
                      icon: Icon(Icons.favorite),
                      text: 'Favorites',
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: <Widget>[
              CategoriesScreen(),
              FavoritesScreen()
            ],
          ),
        ),
      ),
    );
  }
}
