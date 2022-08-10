import 'package:flutter/material.dart';
import 'package:meal_app/model/category_model.dart';
import 'package:meal_app/widgets/category_card.dart';

import '../data/category_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(25.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];
          return CategoryCard(category: category);
        },
      ),
    );
  }
}
