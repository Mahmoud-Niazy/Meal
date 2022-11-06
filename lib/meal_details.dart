import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final recievedData = ModalRoute.of(context)!.settings.arguments as Map ;
    final meal = recievedData['meal'];

    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.network(meal.imageUrl),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              width: 300,
              padding: EdgeInsetsDirectional.all(15),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=> Card(
                  color: Colors.teal,
                  child: Text(meal.ingredients[index],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ) ,
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Steps',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsetsDirectional.all(15),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=> Card(
                  color: Colors.teal,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '${index+1}'
                      ),
                    ),
                    title:  Text( meal.steps[index],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ) ,
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

//Meal App