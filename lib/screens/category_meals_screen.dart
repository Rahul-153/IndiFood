import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? title;
  String? id;
  List<Meal>? mealsData;
  bool isLoadInitData = false;
  @override
  void didChangeDependencies() {
    if (!isLoadInitData) {
      final CategoryRoutes =
          ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
      title = CategoryRoutes['title']!;
      id = CategoryRoutes['id']!;
      mealsData = widget.availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      isLoadInitData=true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      mealsData?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            removeMeal: _removeMeal,
            id: DUMMY_MEALS[idx].id,
            title: DUMMY_MEALS[idx].title,
            imgURL: DUMMY_MEALS[idx].imgURL,
            duration: DUMMY_MEALS[idx].duration,
            complexity: DUMMY_MEALS[idx].complexity,
            affordability: DUMMY_MEALS[idx].affordability,
          );
        },
        itemCount: mealsData?.length,
      ),
    );
  }
}
