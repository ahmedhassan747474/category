import '../screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategroyItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategroyItem(this.id, this.title, this.color);
  void selectCatagory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.rouatName,
      arguments: {
        'id': id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatagory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
