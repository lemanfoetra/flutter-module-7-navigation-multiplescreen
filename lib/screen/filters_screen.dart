import 'package:flutter/material.dart';
import './tabs_screen.dart';
import '../widget/my_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> filterData;
  final Function setFilter;

  FiltersScreen(this.filterData, this.setFilter);

  static const routeName = '/filter_screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<String, bool> filterData = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };

  Widget buildSwitchListTile(
      String title, String subtitle, bool value, Function onChange) {
    return SwitchListTile(
      value: value,
      onChanged: onChange,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }


  void pindahKeMealCategoriScreen(ctx){
    Navigator.of(ctx).pushReplacementNamed(TabsScreen.routeName);
  }

  @override
  void initState() {
    filterData['isGlutenFree'] = widget.filterData['isGlutenFree'];
    filterData['isVegan'] = widget.filterData['isVegan'];
    filterData['isVegetarian'] = widget.filterData['isVegetarian'];
    filterData['isLactoseFree'] = widget.filterData['isLactoseFree'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              widget.setFilter(filterData);
              pindahKeMealCategoriScreen(context);
            },
            child: Icon(Icons.save, color: Colors.white,),
          )
        ],
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
                  filterData['isGlutenFree'],
                  (newValue) {
                    setState(
                      () {
                        filterData['isGlutenFree'] = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals',
                  filterData['isVegan'],
                  (newValue) {
                    setState(
                      () {
                        filterData['isVegan'] = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  filterData['isVegetarian'],
                  (newValue) {
                    setState(
                      () {
                        filterData['isVegetarian'] = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Lactosa Free',
                  'Only include Lactosa Free meals',
                  filterData['isLactoseFree'],
                  (newValue) {
                    setState(
                      () {
                        filterData['isLactoseFree'] = newValue;
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
