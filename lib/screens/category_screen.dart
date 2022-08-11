
import 'package:flutter/material.dart';
import 'package:meal_app/model/category_model.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/meal_card.dart';


class CategoryScreen extends StatefulWidget {
  static const id = '/category';
  final List<Meal> currectMeal;
  const CategoryScreen({
    Key? key, required this.currectMeal,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeal = widget.currectMeal.where((meal) {
      return meal.category!.contains(routeArgs.id);
    }).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgs.title.toString(),
        ),
      ),
      body: ListOfMeal(categoryMeal: categoryMeal),
    );
  }
}

class ListOfMeal extends StatelessWidget {
  const ListOfMeal({
    Key? key,
    required this.categoryMeal,
  }) : super(key: key);

  final List<Meal> categoryMeal;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (context, index) {
          Meal meal = categoryMeal[index];
          return MealCard(meal: meal);
        });
  }
}
