import 'package:flutter/material.dart';
import 'package:meal/meal_provider.dart';
import 'package:provider/provider.dart';

class MealDetails extends StatefulWidget {



  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final recievedData = ModalRoute.of(context)!.settings.arguments as Map;
    final meal = recievedData['meal'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.network(meal.imageUrl),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              width: 300,
              padding: const EdgeInsetsDirectional.all(15),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Card(
                  color: Colors.teal,
                  child: Text(
                    meal.ingredients[index],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsetsDirectional.all(15),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Card(
                  color: Colors.teal,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      meal.steps[index],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Provider.of<MealProvider>(context,listen: true).isFav ? Colors.red : Colors.grey,
        child: const Icon(
          Icons.favorite_border,
        ),
        onPressed: () {
    Provider.of<MealProvider>(context,listen: false).Favorites(meal.id);

        }
    ),
    );

  }
}

//Meal App
