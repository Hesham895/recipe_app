import 'package:flutter/material.dart';
import 'recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ...recipe.ingredients.map((ingredient) => Text(ingredient)).toList(),
            SizedBox(height: 16.0),
            Text(
              'Instructions:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(recipe.instructions),
          ],
        ),
      ),
    );
  }
}
