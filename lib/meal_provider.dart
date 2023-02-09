import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'objects.dart';

class MealProvider with ChangeNotifier{

  // List chosenMeals = DUMMY_MEALS;
  List<Meal> favoritesMeals = [];
  bool isFav = false ;
  // Color color = Colors.grey;

  Favorites(String id) {
    final index = favoritesMeals.indexWhere((element) => element.id == id);

    if (index >= 0) {
      favoritesMeals.removeAt(index);
      // color= Colors.grey;
    } else {
      favoritesMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      // color=Colors.red;
    }
    // isFav = favoritesMeals.any((element) => element.id == id);
    notifyListeners();
  }

  // CheckFav(String id) {
  //   return favoritesMeals.any((element) => element.id == id);
  //






  Map<String, dynamic> filters = {
    'glutenFree': false,
    'vegan': false,
    'vegetarian': false,
    'lactoseFree': false,
  };

  List chosenMeals = DUMMY_MEALS;


  SaveFilters(Map<String, dynamic> filtersData) {

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

    notifyListeners();
  }
}