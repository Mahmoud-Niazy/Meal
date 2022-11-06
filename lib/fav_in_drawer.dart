import 'package:flutter/material.dart';
import 'package:meal/favorites_screen.dart';

import 'objects.dart';

class FavInDrawer extends StatelessWidget {
  List<Meal> fav = [];

  FavInDrawer(this.fav, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
        ),
      ),
      body: FavoritesScreen(fav),
    );
  }
}
