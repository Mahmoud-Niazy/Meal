import 'package:flutter/material.dart';
import 'package:meal/items.dart';

import 'objects.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> fav = [];

  FavoritesScreen(this.fav, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BuildMealItem(fav[index], context),
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemCount: fav.length,
    );
  }
}
