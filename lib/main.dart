import 'package:flutter/material.dart';
import 'package:meal/fav_in_drawer.dart';
import 'package:meal/filters_screen.dart';
import 'package:meal/layout.dart';
import 'package:meal/objects.dart';

import 'dummy_data.dart';
import 'meal_details.dart';
import 'meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> filters = {
    'glutenFree': false,
    'vegan': false,
    'vegetarian': false,
    'lactoseFree': false,
  };

  List chosenMeals = DUMMY_MEALS;

  List<Meal> favoritesMeals = [];

  Favorites(String id) {
    final index = favoritesMeals.indexWhere((element) => element.id == id);

    if (index >= 0) {
      favoritesMeals.removeAt(index);
    } else {
      favoritesMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
    }
  }

  CheckFav(String id) {
    return favoritesMeals.any((element) => element.id == id);
  }

  SaveFilters(Map<String, dynamic> filtersData) {
    setState(() {});
    filters = filtersData;

    chosenMeals = DUMMY_MEALS.where((element) {
      if (filtersData["glutenFree"] == true && element.isGlutenFree == false) {
        return false;
      }
      if (filtersData["vegan"] == true && element.isVegan == false) {
        return false;
      }
      if (filtersData["vegetarian"] == true && element.isVegetarian == false) {
        return false;
      }
      if (filtersData["lactoseFree"] == true &&
          element.isLactoseFree == false) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MealLayout(favoritesMeals),
        'meals': (context) => MealsScreen(chosenMeals),
        'mealDetails': (context) => MealDetails(Favorites, CheckFav),
        'filters': (context) => FiltersScreen(SaveFilters),
        'favDrawer': (context) => FavInDrawer(favoritesMeals),
      },
      // home: MealLayout(),
    );
  }
}
