import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';

import 'objects.dart';

class MealsScreen extends StatefulWidget{
  List chosenMeals ;
  MealsScreen(this.chosenMeals);



  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  ChooseAffordability(Affordability aff){
    if( aff == Affordability.Affordable)
      return 'Affordable' ;
    if( aff == Affordability.Luxurious)
      return 'Luxurious' ;
    if( aff == Affordability.Pricey)
      return 'Pricey' ;
  }

  ChooseComplexity(Complexity aff){
    if( aff == Complexity.Challenging)
      return 'Challenging' ;
    if( aff == Complexity.Hard)
      return 'Hard' ;
    if( aff == Complexity.Simple)
      return 'Simple' ;
  }

  @override
  Widget build(BuildContext context) {
    final x = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic> ;
    String categoryId = x['id']!;
    String categoryTitle = x['title']! ;

    final meals =  widget.chosenMeals.where((element) {
      return element.categories.contains(categoryId);
    } ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body:chose(meals),


    );
  }

  BuildMealItem(Meal meal,context){
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, 'mealDetails',
          arguments: {
          'meal' : meal,
          },
        );
      },
      child: Card(
        elevation: 10,
        child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Image.network(meal.imageUrl),
              Container(
                width: 250,
                color: Colors.black26,
                child: Text(
                  meal.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "${meal.duration} seconds"
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.business_center_outlined,
                      ),
                      SizedBox(width: 5),
                      Text(
                          ChooseComplexity(meal.complexity),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.price_change_outlined,
                      ),
                      SizedBox(width: 5),
                      Text(
                          ChooseAffordability(meal.affordability),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }

  chose(List meal){
    if(meal.length ==0){
      return Center(
        child: Text(
          'There\'s nothing ' ,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
        ),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=> BuildMealItem(meal[index],context),
          separatorBuilder: (context,index)=> SizedBox(
            height: 40,
          ),
          itemCount: meal.length,
        ),
      );
    }
  }
}