import 'package:flutter/material.dart';
import 'package:recipe/screens/favourites_screen.dart';

import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recipe'),
          bottom: TabBar(
            tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
              ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavouritesScreen(),
        ],
        ),
      ),
    );
  }
}