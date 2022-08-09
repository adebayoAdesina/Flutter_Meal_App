import 'package:flutter/material.dart';
import 'package:meal_app/util/color.dart';

class Category {
  String? id;
  String? title;
  Color? color;

  Category({
    this.id,
    this.title,
    this.color = kCategoryColor
  });
}

List<Category> categories = [
  Category(
    id: 'c1',
    title: 'Quick & Easy',
    color: Colors.red
  ),
  Category(
    id: 'c2',
    title: 'Quick & Easy',
    color: Colors.brown
  ),
  Category(
    id: 'c3',
    title: 'Quick & Easy',
    color: Colors.red
  ),
  Category(
    id: 'c4',
    title: 'Quick & Easy',
    color: Colors.pink
  ),
  Category(
    id: 'c5',
    title: 'Quick & Easy',
    color: Colors.red
  ),
  Category(
    id: 'c6',
    title: 'Quick & Easy',
    color: Colors.limeAccent
  ),
  Category(
    id: 'c7',
    title: 'Quick & Easy',
    color: Colors.red
  ),
  Category(
    id: 'c8',
    title: 'Quick & Easy',
    color: Colors.red
  ),
]; 