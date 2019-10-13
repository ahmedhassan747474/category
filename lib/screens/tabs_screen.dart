import 'package:category/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import './categries_screen.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _page = [
    {
      'pages': CategoriesScreen(),
      'title': 'Categoris',
    },
    {
      'pages': FavoriteScreen(),
      'title': 'Favorite',
    }
  ];
  int selectedPageIndex = 0;
  void _selectPage(int index) {
    print(index);
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text(_page[selectedPageIndex]['title']),),
      body: _page[selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        //  backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black45,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categoris'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
