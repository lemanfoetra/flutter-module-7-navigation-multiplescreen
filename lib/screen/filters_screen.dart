import 'package:flutter/material.dart';
import '../widget/my_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter_screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluttenFree = false;
  bool _isVeganFree = false;
  bool _isVegetarianFree = false;
  bool _isLactosaFree = false;

  Widget buildSwitchListTile(
      String title, String subtitle, bool value, Function onChange) {
    return SwitchListTile(
      value: value,
      onChanged: onChange,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Filters',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Gluten-Free',
                  'Only include Gluten-Free meals',
                  _gluttenFree,
                  (newValue) {
                    setState(
                      () {
                        _gluttenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Lactosa-Free',
                  'Only include Lactosa-Free meals',
                  _isLactosaFree,
                  (newValue) {
                    setState(
                      () {
                        _isLactosaFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  _isVegetarianFree,
                  (newValue) {
                    setState(
                      () {
                        _isVegetarianFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _isVeganFree,
                  (newValue) {
                    setState(
                      () {
                        _isVeganFree = newValue;
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
