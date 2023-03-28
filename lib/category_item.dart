import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String? title;
  final Color? color;
  CategoryItem({required this.id, this.title, this.color});
  void SelectCategory(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/category-meals', arguments: {
      'id': id,
      'title': title,
    });
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color!.withOpacity(0.7),
            color!,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
