

import 'package:flutter/material.dart';
import 'package:meal_app/utils/color.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const id = '/settings';
  final Function setFilter;
  final Map<String, bool> currentFilter;
  const SettingsScreen(
      {Key? key, required this.setFilter, required this.currentFilter})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget.currentFilter['isGlutenFree']!;
    isVegan = widget.currentFilter['isVegan']!;
    isVegetarian = widget.currentFilter['isVegetarian']!;
    isLactoseFree = widget.currentFilter['isLactoseFree']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> _filters = {
                  'isGlutenFree': isGlutenFree,
                  'isVegan': isVegan,
                  'isVegetarian': isVegetarian,
                  'isLactoseFree': isLactoseFree,
                };
                widget.setFilter(_filters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: kPrimaryColor),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              switchList(
                  isGlutenFree, 'Gluten-free', 'Only include gluten-free meals',
                  (value) {
                setState(() {
                  isGlutenFree = value;
                });
              }),
              switchList(isLactoseFree, 'Lactose-free',
                  'Only include Lactose-free meals', (value) {
                setState(() {
                  isLactoseFree = value;
                });
              }),
              switchList(isVegan, 'Vegan-free', 'Only include Vegan-free meals',
                  (value) {
                setState(() {
                  isVegan = value;
                });
              }),
              switchList(isVegetarian, 'Vegeterian-free',
                  'Only include Lactose-free meals', (value) {
                setState(() {
                  isVegetarian = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile switchList(
      bool values, String text, String subtitle, updateValue) {
    return SwitchListTile.adaptive(
      value: values,
      onChanged: updateValue,
      title: Text(text),
      subtitle: Text(subtitle),
    );
  }
}
