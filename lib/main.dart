import 'package:flutter/material.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meals_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        '/category-meals': (context) => CategoryMealsScreen(),
        '/meals-detail': (context) => MealsDetailScreen(),
        '/filters': (context) => FiltersScreen(),
      },
    );
  }
}
