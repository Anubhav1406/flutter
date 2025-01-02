import 'package:flutter/material.dart';
import 'homepage.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'saved_articles_screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    routes: {
      '/profile': (context) => ProfileScreen(),
      '/search': (context) => SearchScreen(),
      '/saved': (context) => SavedArticlesScreen(),
    },
  ));
}
