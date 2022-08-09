import 'package:flutter/material.dart';
import 'package:meal_app/model/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal'),
      ),
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
          return Container(
            padding: const EdgeInsets.all(15.0),
            child: Text(category.title.toString()),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  category.color!.withOpacity(0.4),
                  category.color!,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(15.0)),
          );
        },
      ),
    );
  }
}
