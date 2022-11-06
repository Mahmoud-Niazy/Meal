import 'package:flutter/material.dart';

import 'objects.dart';

BuildMealItem(Meal meal, context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(
        context,
        'mealDetails',
        arguments: {
          'meal': meal,
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
                  style: const TextStyle(
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
                      const Icon(
                        Icons.access_time_outlined,
                      ),
                      const SizedBox(width: 5),
                      Text("${meal.duration} seconds"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.business_center_outlined,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        ChooseComplexity(meal.complexity),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.price_change_outlined,
                      ),
                      const SizedBox(width: 5),
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

ChooseAffordability(Affordability aff) {
  if (aff == Affordability.Affordable) {
    return 'Affordable';
  }
  if (aff == Affordability.Luxurious) {
    return 'Luxurious';
  }
  if (aff == Affordability.Pricey) {
    return 'Pricey';
  }
}

ChooseComplexity(Complexity aff) {
  if (aff == Complexity.Challenging) {
    return 'Challenging';
  }
  if (aff == Complexity.Hard) {
    return 'Hard';
  }
  if (aff == Complexity.Simple) {
    return 'Simple';
  }
}
