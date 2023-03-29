import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Center(child: Text("Filters"),);,
    );
  }
}