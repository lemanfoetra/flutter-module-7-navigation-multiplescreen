import 'package:flutter/material.dart';

class CategoriesMeal extends StatelessWidget {

  final String id;
  final String title;

  CategoriesMeal(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('The Recipes for Category $title'),
      ),
    );
  }
}
