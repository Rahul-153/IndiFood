import 'package:flutter/material.dart';

import './category_item.dart';
import './dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  final gridView=GridView(
    padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((catData) => CategoryItem(
        id: catData.id,
        title: catData.title,
        color: catData.color,
      )).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IndiFood")),
      body: gridView,
      );
  }
}
