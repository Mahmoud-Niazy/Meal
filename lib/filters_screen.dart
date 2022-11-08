import 'package:flutter/material.dart';
import 'package:meal/meal_provider.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  static bool glutenFree = false;
  static bool vegan = false;
  static bool vegetarian = false;
  static bool lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, dynamic> newFilters = {
                'glutenFree': glutenFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
                'lactoseFree': lactoseFree,
              };
              Provider.of<MealProvider>(context,listen: false).SaveFilters(newFilters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Adjust your meal selection ',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    value: glutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        glutenFree = newValue;
                      });
                    },
                    title: const Text(
                      "Gluten Free",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SwitchListTile(
                    value: vegan,
                    onChanged: (newValue) {
                      setState(() {
                        vegan = newValue;
                      });
                    },
                    title: const Text(
                      "Vegan",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SwitchListTile(
                    value: vegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        vegetarian = newValue;
                      });
                    },
                    title: const Text(
                      "Vegetarian",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SwitchListTile(
                    value: lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        lactoseFree = newValue;
                      });
                    },
                    title: const Text(
                      "LactoseFree",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
