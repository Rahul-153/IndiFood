import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilters;
  final _savedFilters;
  FiltersScreen(this.setFilters,this._savedFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;
  bool _LactoseFree = false;
  @override
  void initState() {
    _GlutenFree=widget._savedFilters['Gluten'];
    _LactoseFree=widget._savedFilters['lactose'];
    _Vegan=widget._savedFilters['vegan'];
    _Vegetarian=widget._savedFilters['vegetarian'];
    super.initState();
  }
  Widget buildSwitchTile(String title, String subtitle, bool type,
      Function(bool) onChangeHandler) {
    return SwitchListTile(
      value: type,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: onChangeHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> savedFilters = {
                  'Gluten': _GlutenFree,
                  'lactose': _LactoseFree,
                  'vegan': _Vegan,
                  'vegetarian': _Vegetarian
                };
                widget.setFilters(savedFilters);
              },
              icon: Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your Meals Selection",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTile(
                  "Gluten-Free", "Only Gluten free meals", _GlutenFree,
                  (newvalue) {
                setState(() {
                  _GlutenFree = newvalue;
                });
              }),
              buildSwitchTile("Vegan", "Only Vegan meals", _Vegan, (newvalue) {
                setState(() {
                  _Vegan = newvalue;
                });
              }),
              buildSwitchTile(
                  "Vegetarian", "Only Vegetarian meals", _Vegetarian,
                  (newvalue) {
                setState(() {
                  _Vegetarian = newvalue;
                });
              }),
              buildSwitchTile(
                  "Lactose-Free", "Only Lactose free meals", _LactoseFree,
                  (newvalue) {
                setState(() {
                  _LactoseFree = newvalue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
