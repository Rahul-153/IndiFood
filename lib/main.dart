import 'package:flutter/material.dart';

import './category_screen.dart';
import './category_meals_screen.dart';

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
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.green,
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodySmall: TextStyle(color:Color.fromRGBO(20, 51, 51, 1)),
          bodyLarge: TextStyle(color:Color.fromRGBO(20, 51, 51, 1)),
          titleSmall: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>CategoryScreen(),
        '/category-meals':(context)=>CategoryMealsScreen(),
      },
    );
  }
}
