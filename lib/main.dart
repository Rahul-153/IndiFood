import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meals_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> filters={
    'Gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false
  };
  List<Meal> availableMeals=DUMMY_MEALS;
  void _setFilters(Map<String,bool> newFilters){
    setState(() {
      filters=newFilters;
      availableMeals=DUMMY_MEALS.where((meal){
        if(filters['Gluten']! && !meal.isGlutenFree)
        return false;
        if(filters['lactose']! && !meal.isLactoseFree)
        return false;
        if(filters['vegetarian']! && !meal.isVegetarian)
        return false;
        if(filters['vegan']! && !meal.isVegan)
        return false;
        return true;
      } ).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndiFood',
      theme: ThemeData(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.pink, secondary: Colors.amber),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleSmall: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        '/category-meals': (context) => CategoryMealsScreen(availableMeals),
        '/meals-detail': (context) => MealsDetailScreen(),
        '/filters': (context) => FiltersScreen(_setFilters,filters),
      },
    );
  }
}
