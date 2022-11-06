import 'package:flutter/material.dart';
import 'dummy_data.dart';

class FiltersScreen extends StatefulWidget {
  Function save ;
  FiltersScreen(this.save);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  static bool glutenFree = false;
  static bool vegan = false;
  static bool vegetarian = false;
  static bool lactoseFree = false;

  //  final chosenMeals = DUMMY_MEALS.where((element){
  //   if(glutenFree==true){
  //     if(element.isGlutenFree){
  //       return true ;
  //     }
  //     else{
  //       return false ;
  //     }
  //   }
  //   if(vegan ==true){
  //     if(element.isVegan){
  //       return true ;
  //     }
  //     else{
  //       return false ;
  //     }
  //   }
  //   if(vegetarian ==true){
  //     if(element.isVegetarian){
  //       return true ;
  //     }
  //     else{
  //       return false ;
  //     }
  //   }
  //   if(lactoseFree ==true){
  //     if(element.isLactoseFree){
  //       return true ;
  //     }
  //     else{
  //       return false ;
  //     }
  //   }
  //   return true ;
  // } ).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters'
        ),
        actions: [
          IconButton(
            onPressed: () {
              Map<String,dynamic> newFilters = {
                'glutenFree' : glutenFree ,
                'vegan' : vegan ,
                'vegetarian' : vegetarian ,
                'lactoseFree' : lactoseFree ,
              };
              widget.save(newFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Adjust your meal selection ',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SwitchListTile(
              value: glutenFree,
              onChanged: (newValue) {
                setState(() {
                  glutenFree = newValue;
                  print(glutenFree);
                });
              },
              title: Text(
                "Gluten Free",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SwitchListTile(
              value: vegan,
              onChanged: (newValue) {
                setState(() {
                  vegan = newValue;
                });
              },
              title: Text(
                "Vegan",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SwitchListTile(
              value: vegetarian,
              onChanged: (newValue) {
                setState(() {
                  vegetarian = newValue;
                });
              },
              title: Text(
                "Vegetarian",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SwitchListTile(
              value: lactoseFree,
              onChanged: (newValue) {
                setState(() {
                  lactoseFree = newValue;
                });
              },
              title: Text(
                "LactoseFree",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/',
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text(
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
          ],
        ),
      ),
    );
  }
}
