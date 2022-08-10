enum Complexity { simple, challenging, hard }
enum Affordability { affordable, pricey, luxurious }

class Meal {
  String? id;
  List<String>? category;
  String? title;
  String? imageUrl;
  List<String>? ingredients;
  List<String>? steps;
  int? duration;
  Complexity? complexity;
  Affordability? affordability;
  bool? isGlutenFree;
  bool? isLactoseFree;
  bool? isVegan;
  bool? isVegetarian;

  Meal({
    this.id,
    this.category,
    this.title,
    this.imageUrl,
    this.ingredients,
    this.steps,
    this.duration,
    this.complexity,
    this.affordability,
    this.isGlutenFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,
  });

  String get complexityText {
    String res = '';
    switch (complexity) {
      case Complexity.simple:
        res = 'Simple';
        break;
      case Complexity.challenging:
        res = 'Challenging';
        break;
      default:
        res = 'Hard';
    }
    return res;
  }

  String get affordableText {
    String res = '';
    switch (affordability) {
      case Affordability.luxurious:
        res = 'Luxurious';
        break;
      case Affordability.pricey:
        res = 'Pricey';
        break;
      default:
        res = 'Affordable';
    }
    return res;
  }
}
