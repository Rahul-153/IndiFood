import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './category_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  final List<Map<String, dynamic>> _pages = [
    {'page': CategoryScreen(), 'title': 'Categories'},
    {'page': FavouriteScreen(), 'title': 'Favourites'}
  ];
  int _selectedidx = 0;
  void _selectedPage(int idx) {
    setState(() {
      _selectedidx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedidx]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedidx]['page'],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedidx,
          onTap: _selectedPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: "Favourites"),
          ]),
    );
  }
}
