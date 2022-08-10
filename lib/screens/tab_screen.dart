import 'package:flutter/material.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/screens/home_screen.dart';

class TabScreen extends StatefulWidget {
  static const id = '/tab';
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _page = const [
    HomeScreen(),
    FavoriteScreen(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _page[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: ((value) => setState(
                  () {
                    currentIndex = value;
                  },
                )),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                  ),
                  label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.star,
                  ),
                  label: 'Favorite'),
            ]));
  }
}
