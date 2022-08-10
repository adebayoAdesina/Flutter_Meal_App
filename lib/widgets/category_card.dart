import 'package:flutter/material.dart';
import 'package:meal_app/model/category_model.dart';
import 'package:meal_app/screens/category_screen.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).colorScheme.primary,
      onTap: (() => Navigator.pushNamed(
            context,
            CategoryScreen.id, arguments: category )),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(category.title.toString()),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              category.color!.withOpacity(0.4),
              category.color!,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
