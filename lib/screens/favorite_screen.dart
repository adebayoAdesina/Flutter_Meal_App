import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';

import '../model/meal.dart';

class FavoriteScreen extends StatelessWidget {
  static const id = '/favorites';
  final List<Meal> favorite;
  const FavoriteScreen({ Key? key, required this.favorite }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favorite.isNotEmpty) {
      return Scaffold(
        body: ListOfMeal(categoryMeal: favorite),
      );
    } else {
      return const Scaffold(
      body: Center(
        child: Text('You have no favorites yet'),
      ),
    );
    }
    
  }
}