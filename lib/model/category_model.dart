import 'package:flutter/material.dart';
import 'package:meal_app/utils/color.dart';

class Category {
  String? id;
  String? title;
  Color? color;

  Category({
    this.id,
    this.title,
    this.color = kCategoryColor,
  });
}
