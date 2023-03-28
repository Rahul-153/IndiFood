import 'package:flutter/material.dart';

import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  String? title;
  String? id;
  @override
  Widget build(BuildContext context) {
    final CategoryRoutes=ModalRoute.of(context)!.settings.arguments as Map<String,String?>;
    title=CategoryRoutes['title']!;
    id=CategoryRoutes['id']!;
    final mealsData=DUMMY_MEALS.where((meal)
    {
      return meal.categories.contains(id);
    }
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(itemBuilder: (ctx,idx){
        return Text(mealsData[idx].title);
      },itemCount: mealsData.length,),
    );
  }
}
