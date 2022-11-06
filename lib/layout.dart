import 'package:flutter/material.dart';
import 'package:meal/categories_screen.dart';
import 'package:meal/favorites_screen.dart';

class MealLayout extends StatefulWidget{
  @override
  State<MealLayout> createState() => _MealLayoutState();
}

class _MealLayoutState extends State<MealLayout> {

  int currentIndex =0 ;
  List<Widget> screens = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meal App',
        ),
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
        onTap: (index){
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
              padding: EdgeInsetsDirectional.all(20),
              color: Colors.teal,
              height: 200,
              width: double.infinity,
              child: Text(
                'Cooking Up !',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant,
              ),
              title: Text(
                'Meals',
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text(
                'Filter',
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: (){
                Navigator.pushReplacementNamed(context, 'filters');
              },
            ),
          ],
        ),
      ),
    );
  }
}