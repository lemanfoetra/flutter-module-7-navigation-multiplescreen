import 'package:flutter/material.dart';
import '../widget/my_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filter_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('Filters'),
      ),
      drawer: MyDrawer(),
    );
  }
}
