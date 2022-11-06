
import 'package:flutter/material.dart';

class Category {
  late String id ;
  late String title ;
  late Color color ;

  Category({
    required this.id,
    required this.title,
    required this.color ,
});
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

class Meal {
  late String id ;
  late List<String> categories ;
  late String title ;
  late Affordability affordability;
  late Complexity complexity;
  late String imageUrl;
  late int duration;
  late List<String> ingredients ;
  late List<String> steps;
  late bool isGlutenFree ;
  late bool isVegan;
  late bool isVegetarian;
  late bool isLactoseFree;

  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.steps,
});
}