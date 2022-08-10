import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/home_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tab_screen.dart';
import 'utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        TabScreen.id: ((context) => const TabScreen()),
        CategoryScreen.id: (context) => const CategoryScreen(),
        MealDetailScreen.id: (context) => const MealDetailScreen()
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (_) => const TabScreen(),
        );
      },
    );
  }
}
