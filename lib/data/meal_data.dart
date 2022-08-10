import '../model/meal.dart';

List<Meal> meals = [
  Meal(
    id: 'ml',
    category: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce,',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl: 'assets/image/R.png',
    duration: 30,
    ingredients: [
      'white and green asparagus',
      '30g Pine Nuts',
      'Saled',
      'Salt, pepper and Olive oil',
      '300g Cherry Tomatoes'
    ],
    steps: [
      'Wash peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, saled and dressing',
      'Serve with Baguette'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'sl',
    category: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce.',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl: 'assets/image/R.png',
    duration: 30,
    ingredients: [
      'white and green asparagus',
      '30g Pine Nuts',
      'Saled',
      'Salt, pepper and Olive oil',
      '300g Cherry Tomatoes'
    ],
    steps: [
      'Wash peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, saled and dressing',
      'Serve with Baguette'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
