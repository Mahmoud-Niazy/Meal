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
    bool isFav = false;
    // bool inFav = Provider.of<MealProvider>(context,listen: true).favoritesMeals.contains(meal.id);
    isInFav(){
      Provider.of<MealProvider>(context).favoritesMeals.forEach((element) {
        if(element.id==meal.id){
          isFav = true;
        }
      });
      initState(){
        isInFav();
      }
    }

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
            InkWell(
              onTap: (){
                // print(meal.id);
                // print( Provider.of<MealProvider>(context, listen: false)
                //     .favoritesMeals.forEach((element) {
                //       element.id == id;
                // });
                // );
                //     .contains(meal.id));
                Provider.of<MealProvider>(context,listen: false).Favorites(meal.id);
                isInFav();
              },
              child: CircleAvatar(
                backgroundColor: isFav? Colors.red : Colors.grey,
                // Provider.of<MealProvider>(context, listen: true)
                //         .favoritesMeals
                //         .contains(meal.id) == true
                //     ? Colors.red
                //     : Colors.grey,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
      //   floatingActionButton: FloatingActionButton(
      //     backgroundColor:
      //     Provider.of<MealProvider>(context,listen: true).favoritesMeals.contains(meal.id) ? Colors.red : Colors.grey,
      //     child: const Icon(
      //       Icons.favorite_border,
      //     ),
      //     onPressed: () {
      // Provider.of<MealProvider>(context,listen: false).Favorites(meal.id);
      //
      //     }
      // ),
    );
  }
}

//Meal App
