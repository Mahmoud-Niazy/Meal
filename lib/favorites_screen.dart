import 'package:flutter/material.dart';
import 'package:meal/items.dart';
import 'package:provider/provider.dart';

import 'meal_provider.dart';
import 'objects.dart';

class FavoritesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    List<Meal> fav = Provider.of<MealProvider>(context).favoritesMeals;

    return ListView.separated(
      itemBuilder: (context, index) => BuildMealItem(fav[index], context),
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemCount: fav.length,
    );
  }
}
