import 'package:category/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon, Function tabHandle) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tabHandle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking UP',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTitle('Meals', Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTitle('Filters', Icons.settings,(){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}),
        ],
      ),
    );
  }
}
