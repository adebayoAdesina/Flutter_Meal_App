import 'package:flutter/material.dart';
import 'package:meal_app/screens/favorite_screen.dart';
import 'package:meal_app/screens/home_screen.dart';

import '../model/meal.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  static const id = '/';
  final List<Meal> favorite;
  const TabScreen({Key? key, required this.favorite}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, dynamic>> _page = [];
  
@override
void initState() {
  super.initState();
  _page = [
    {
      'page': const HomeScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoriteScreen(favorite: widget.favorite),
      'title': 'Your Favorites',
    }
  ];
}
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _page[currentIndex]['title'],
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      drawer: const MainDrawer(),
      body: _page[currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor:
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
        currentIndex: currentIndex,
        onTap: ((value) => setState(
              () {
                currentIndex = value;
              },
            )),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            icon: const Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              icon: const Icon(
                Icons.star,
              ),
              label: 'Favorite'),
        ],
      ),
    );
  }
}
