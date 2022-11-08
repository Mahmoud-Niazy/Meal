import 'package:flutter/material.dart';
import 'package:meal/meal_provider.dart';
import 'package:provider/provider.dart';

import 'items.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({Key? key}) : super(key: key);



  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    final x =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String categoryId = x['id']!;
    String categoryTitle = x['title']!;

    final meals = Provider.of<MealProvider>(context).chosenMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: chose(meals),
    );
  }

  chose(List meal) {
    if (meal.isEmpty) {
      return const Center(
        child: Text(
          'There\'s nothing ',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => BuildMealItem(meal[index], context),
          separatorBuilder: (context, index) => const SizedBox(
            height: 40,
          ),
          itemCount: meal.length,
        ),
      );
    }
  }
}
