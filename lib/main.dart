import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/movie_search_screen.dart';
import 'screens/movie_details_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MovieApp(),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MovieSearchScreen(),
      routes: {
        '/details': (context) => const MovieDetailsScreen(),
        '/favorites': (context) => const FavoritesScreen(),
      },
    );
  }
}  