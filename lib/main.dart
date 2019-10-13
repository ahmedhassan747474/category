import 'package:category/dummy_date.dart';

import './screens/category_meals_screen.dart';

import './screens/categries_screen.dart';
import 'package:flutter/material.dart';

import './screens/meal_detail_Screen.dart';
import './screens/tabs_screen.dart';
import 'modle/meal.dart';
import 'screens/filter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
         if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        } if (_filters['vegan'] && !meal.isVegan) {
          return false;
        } if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;


          
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 54, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 54, 51, 1),
            ),
            title: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.rouatName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.rouatName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters,_setFilters),
      },
    );
  }
}
