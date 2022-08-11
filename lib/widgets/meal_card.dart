import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

import '../model/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({Key? key, required this.meal}) : super(key: key);

  void selectedMeal(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailScreen.id,
      arguments: meal,
    )

        // .then(
        //   (value) => value!= null ? meals.removeWhere(
        //     (element) => element.id == value,
        //   ): null,
        // );
        ;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        elevation: 4.0,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      15.0,
                    ),
                    topRight: Radius.circular(
                      15.0,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary
                    ])),
                    child: Image(
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        meal.imageUrl.toString(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 10.0,
                  child: Container(
                    width: size.width * 0.7,
                    padding: EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                        left: 10.0,
                        right: size.width * 0.27),
                    color: Colors.black.withOpacity(0.2),
                    child: Text(
                      meal.title.toString(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cardBottomView(Icons.schedule, '${meal.duration} min'),
                  cardBottomView(Icons.work, meal.complexityText),
                  cardBottomView(Icons.money, meal.affordableText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row cardBottomView(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(text)
      ],
    );
  }
}
