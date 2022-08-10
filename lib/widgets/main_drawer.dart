import 'package:flutter/material.dart';
import 'package:meal_app/screens/tab_screen.dart';
import 'package:meal_app/utils/color.dart';

import '../screens/settings_screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  List<Map<String, dynamic>> drawerItem = [
    {
      'icon': Icons.restaurant,
      'title': 'Meals',
      'onTap': (context) {
        Navigator.pushReplacementNamed(context, TabScreen.id,);
      },
    },
    {
      'icon': Icons.settings,
      'title': 'Setting',
      'onTap': (context) {
        Navigator.pushReplacementNamed(context, SettingsScreen.id,);
      },
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: drawerItem.length,
              itemBuilder: (context, index) {
                final drawer = drawerItem[index];
                return ListTile(
                  leading: Icon(
                    drawer['icon'],
                    color: kWhiteColor,
                    size: 26,
                  ),
                  title: Text(
                    drawer['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      color: kWhiteColor,
                    ),
                  ),
                  onTap: () =>drawer['onTap'](context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
