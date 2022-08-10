import 'package:flutter/material.dart';

class ContentBuild extends StatelessWidget {
  const ContentBuild({
    Key? key,
    required this.currentMeal,
  }) : super(key: key);

  final String currentMeal;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(currentMeal),
    ));
  }
}
