import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

class MealDetailSceen extends StatefulWidget {

  static const routeName = '/meal-detail';
  final Function setIdMealFavorite;
  final List<String> listIdMealFavorite;

  MealDetailSceen(this.setIdMealFavorite, this.listIdMealFavorite);

  @override
  _MealDetailSceenState createState() => _MealDetailSceenState();
}




class _MealDetailSceenState extends State<MealDetailSceen> {


  bool isMealFavorite(String idMeal) {
    var count = widget.listIdMealFavorite.where((id) => id == idMeal).toList();
    if (count.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context).settings.arguments as String;

    var dataMeal = DUMMY_MEALS.firstWhere((data) {
      return data.id == mealId;
    });

    List<Widget> listStep = [];
    for (var i = 0; i < dataMeal.steps.length; i++) {
      listStep.add(Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Text('# ${(i + 1)}'),
            ),
            title: Text(dataMeal.steps[i]),
          ),
          Divider(),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(dataMeal.title),
      ),
      body: ListView(
        children: <Widget>[
          // GAMBAR
          Container(
            height: 300,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(
                  dataMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    color: Colors.black45,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      dataMeal.title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),

                // widget Mengubah meal menjadi favorite
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    child: InkWell(
                      child: Icon(
                        isMealFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 40,
                      ),
                      onTap: () {
                        setState(() {
                          isMealFavorite(mealId);
                        });
                        widget.setIdMealFavorite(mealId);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ), // END GAMBAR

          Container(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            child: Text(
              'Ingredients',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          ...dataMeal.ingredients.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Text(
                    data,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                )
              ],
            );
          }).toList(),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Steps',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          ...listStep,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return null; //Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
