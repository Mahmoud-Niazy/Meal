import 'package:flutter/material.dart';
import 'package:meal/filters_screen.dart';
import 'package:meal/layout.dart';

import 'dummy_data.dart';
import 'meal_details.dart';
import 'meals_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,dynamic> filters = {
    'glutenFree' : false ,
    'vegan' : false ,
    'vegetarian' : false ,
    'lactoseFree' : false ,
  };

  List chosenMeals = DUMMY_MEALS ;

  SaveFilters(Map<String,dynamic> filtersData){
    setState(() {

    });
    filters =filtersData ;

     chosenMeals = DUMMY_MEALS.where((element){
      if(filtersData["glutenFree"]==true&& element.isGlutenFree==false){
       return false ;
      }
      if(filtersData["vegan"] ==true&& element.isVegan == false){
       return false ;
      }
      if(filtersData["vegetarian"] ==true && element.isVegetarian == false ){
       return false ;
      }
      if(filtersData["lactoseFree"] ==true && element.isLactoseFree ==false){
       return false ;
      }
      return true ;
    } ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => MealLayout(),
        'meals' : (context) => MealsScreen(chosenMeals),
        'mealDetails' : (context) => MealDetails(),
        'filters' : (context) => FiltersScreen(SaveFilters),
      },
      // home: MealLayout(),
    );
  }
}