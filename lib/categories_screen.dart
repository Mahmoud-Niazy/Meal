import 'package:flutter/material.dart';

import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GridView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
      ),
      children: DUMMY_CATEGORIES
          .map((e) => InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'meals',
                    arguments: {
                      'id': e.id,
                      'title': e.title,

                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: e.color,
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        e.color.withOpacity(.7),
                        e.color,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      e.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
