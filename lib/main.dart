import 'package:flutter/material.dart';
import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/settings_screen.dart';
import 'package:meal_app/screens/tab_screen.dart';
import 'model/meal.dart';
import 'utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false,
  };

  List<Meal> currectMeal = meals;

  void _setFilter(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      currectMeal = meals.where((element) {
        if (_filters['isGlutenFree'] == false &&
            element.isGlutenFree == false) {
          return false;
        }
        if (_filters['isVegan'] == false && element.isVegan == false) {
          return false;
        }
        if (_filters['isVegetarian'] == false &&
            element.isVegetarian == false) {
          return false;
        }
        if (_filters['isLactoseFree'] == false &&
            element.isLactoseFree == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> favorites = [];

  void addFavorities(Meal meal) {
    final check = favorites.indexWhere((element) => element == meal);
    
    favorites.isNotEmpty
        ? check == -1
            ? setState(() {
                favorites.add(meal);
              })
            : setState(() {
                favorites.removeWhere((elements) => elements.id == meal.id);
              })
        : setState(() {
            favorites.add(meal);
          });
  }

  bool isFavoriteMeal(Meal meal) {
    return favorites.any((element) => element == meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: kPrimaryColor,
          onPrimary: kWhiteColor,
          secondary: kSecondaryColor,
          onSecondary: kWhiteColor,
          error: Colors.red,
          onError: Colors.red,
          background: kWhiteColor,
          onBackground: kWhiteColor,
          surface: kPrimaryColor,
          onSurface: kPrimaryColor,
        ),
        fontFamily: 'Libre Baskerville',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: const TextStyle(
                fontSize: 24.0,
                color: kWhiteColor,
              ),
            ),
      ),
      initialRoute: TabScreen.id,
      routes: {
        TabScreen.id: ((context) => TabScreen(
              favorite: favorites,
            )),
        CategoryScreen.id: (context) =>
            CategoryScreen(currectMeal: currectMeal),
        MealDetailScreen.id: (context) => MealDetailScreen(
              addFavorities: addFavorities,
              isFavoriteMeal: isFavoriteMeal,
            ),
        SettingsScreen.id: (context) => SettingsScreen(
              setFilter: _setFilter,
              currentFilter: _filters,
            )
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (_) => TabScreen(
            favorite: favorites,
          ),
        );
      },
    );
  }
}
