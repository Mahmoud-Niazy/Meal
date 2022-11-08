import 'package:flutter/material.dart';
import 'package:meal/favorites_screen.dart';


class FavInDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
        ),
      ),
      body: FavoritesScreen(),
    );
  }
}
