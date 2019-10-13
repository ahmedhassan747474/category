import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilters;
  final Map<String, bool> currentfilters;
  FilterScreen(this.currentfilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.currentfilters['gluten'];
    _lactoseFree = widget.currentfilters['lactose'];
    _vegan = widget.currentfilters['vegan'];
    _vegetarian = widget.currentfilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectfilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectfilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTitle(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree, (updateValue) {
                  setState(() {
                    _glutenFree = updateValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Lactuse-free',
                    'Only include Lactuse-free meals',
                    _lactoseFree, (updateValue) {
                  setState(() {
                    _lactoseFree = updateValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegetrian-free',
                    'Only include Vegetrian-free meals',
                    _vegetarian, (updateValue) {
                  setState(() {
                    _vegetarian = updateValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegen-free', 'Only include Vegen-free meals', _vegan,
                    (updateValue) {
                  setState(() {
                    _vegan = updateValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
