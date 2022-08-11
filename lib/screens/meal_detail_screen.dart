import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/utils/color.dart';

import '../widgets/content_build.dart';

class MealDetailScreen extends StatelessWidget {
  static const id = '/meal';
  final Function addFavorities;
  final bool Function(Meal) isFavoriteMeal;
  const MealDetailScreen(
      {Key? key, required this.addFavorities, required this.isFavoriteMeal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgs.title.toString(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary
              ])),
              height: 300,
              width: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  routeArgs.imageUrl.toString(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            sectionTitle(context, 'Ingredients'),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: routeArgs.ingredients!.length,
              itemBuilder: (context, index) {
                final currentMeal = routeArgs.ingredients![index];
                return ContentBuild(currentMeal: '• $currentMeal');
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            sectionTitle(context, 'Steps'),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: routeArgs.steps!.length,
              itemBuilder: (context, index) {
                final currentMeal = routeArgs.steps![index];
                return ContentBuild(currentMeal: '${index + 1} $currentMeal');
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFavorities(routeArgs);
          Navigator.pop(context, routeArgs.id);
        },
        child: Icon(
          isFavoriteMeal(routeArgs) ? Icons.star : Icons.star_border
        ),
      ),
    );
  }

  Text sectionTitle(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            color: kPrimaryColor,
          ),
    );
  }
}
