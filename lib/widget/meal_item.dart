import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.title,
    @required this.imgUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complex {
    if (complexity == Complexity.Challenging) {
      return "challenging";
    } else if (complexity == Complexity.Hard) {
      return "Hard";
    } else if (complexity == Complexity.Simple) {
      return "Simple";
    } else {
      return "unknow";
    }
  }

  String get affordable {
    if (affordability == Affordability.Affordable) {
      return "affordable";
    } else if (affordability == Affordability.Luxurious) {
      return "Luxurious";
    } else if (affordability == Affordability.Pricey) {
      return "Pricey";
    }
  }

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // End image

                // title
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black45,
                    width: 250,
                    child: Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),
                ),
                // End title
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // duration
                  Row(
                    children: <Widget>[
                      Icon(Icons.timer),
                      Text(" $duration Menit"),
                    ],
                  ), // End duration

                  //complexity
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      Text(" $complex"),
                    ],
                  ), // End Complexity

                  //Affordable
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(" $affordable"),
                    ],
                  ), // End Affordable
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
