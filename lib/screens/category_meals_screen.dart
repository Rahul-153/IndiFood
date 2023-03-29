import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  String? title;
  String? id;
  @override
  Widget build(BuildContext context) {
    final CategoryRoutes =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    title = CategoryRoutes['title']!;
    id = CategoryRoutes['id']!;
    final mealsData = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            title: DUMMY_MEALS[idx].title,
            imgURL: DUMMY_MEALS[idx].imgURL,
            duration: DUMMY_MEALS[idx].duration,
            complexity: DUMMY_MEALS[idx].complexity,
            affordability: DUMMY_MEALS[idx].affordability,
          );
        },
        itemCount: mealsData.length,
      ),
    );
  }
}
