import 'package:flutter/material.dart';

import '../model/meal.dart';

class FavoriteScreen extends StatelessWidget {
  static const id = '/favorites';
  final List<Meal> favorite;
  const FavoriteScreen({ Key? key, required this.favorite }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ,
    );
  }
}