
import 'package:flutter/material.dart';
import 'package:meal_app/model/category_model.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/meal_card.dart';

import '../data/meal_data.dart';

class CategoryScreen extends StatelessWidget {
  static const id = '/category';

  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeal = meals.where((meal) {
      return meal.category!.contains(routeArgs.id);
    }).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgs.title.toString(),
        ),
      ),
      body: ListView.builder(
          itemCount: categoryMeal.length,
          itemBuilder: (context, index) {
            Meal meal = categoryMeal[index];
            return MealCard(meal: meal);
          }),
    );
  }
}
