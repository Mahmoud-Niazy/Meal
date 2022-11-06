import 'package:flutter/material.dart';
import 'package:meal/categories_screen.dart';
import 'package:meal/favorites_screen.dart';

import 'objects.dart';

class MealLayout extends StatefulWidget {
  List<Meal> fav = [];

  MealLayout(this.fav, {Key? key}) : super(key: key);

  @override
  State<MealLayout> createState() => _MealLayoutState();
}

class _MealLayoutState extends State<MealLayout> {
  int currentIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const CategoriesScreen(),
      FavoritesScreen(widget.fav),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meal App',
        ),
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(
              Icons.category_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
      body: screens[currentIndex],
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsetsDirectional.all(20),
              color: Colors.teal,
              height: 200,
              width: double.infinity,
              child: const Text(
                'Cooking Up !',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.restaurant,
              ),
              title: const Text(
                'Meals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'filters');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite_border,
              ),
              title: const Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'favDrawer');
              },
            ),
          ],
        ),
      ),
    );
  }
}
