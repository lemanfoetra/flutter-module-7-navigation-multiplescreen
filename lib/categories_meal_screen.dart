import 'package:flutter/material.dart';

class CategoriesMeal extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var routeData = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeData['id'];
    final String title = routeData['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('The Recipes for Category '),
      ),
    );
  }
}
