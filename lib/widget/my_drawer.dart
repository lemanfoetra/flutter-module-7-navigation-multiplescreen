import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  
  Widget listDrewer(String title, IconData icon) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, left: 15),
          child: Divider(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            child: Center(
              child: Text(
                'Cooking Up!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          listDrewer('Meal', Icons.fastfood),
          listDrewer('Filters', Icons.settings),
        ],
      ),
    );
  }
}
