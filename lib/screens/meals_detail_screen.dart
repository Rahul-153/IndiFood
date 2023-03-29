import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealsDetailScreen extends StatelessWidget {
  Widget buildSectionTitle(String text, BuildContext ctx) {
    return Container(
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.titleSmall,
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 180,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    String MealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == MealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imgURL,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, idx) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[idx]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps', context),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, idx) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${idx + 1}'),
                    ),
                    title: Text(selectedMeal.steps[idx]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
    );
  }
}
