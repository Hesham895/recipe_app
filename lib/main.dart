import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe_model.dart';
import 'recipe_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipeModel(),
      child: MaterialApp(
        title: 'Recipe App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RecipeListScreen(),
      ),
    );
  }
}
