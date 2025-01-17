import 'package:flutter/foundation.dart';

class Recipe {
  final String title;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.title,
    required this.ingredients,
    required this.instructions,
  });
}

class RecipeModel extends ChangeNotifier {
  List<Recipe> _recipes = [
    Recipe(
        title: "Spaghetti Carbonara",
        ingredients: [
          "200g spaghetti",
          "100g pancetta",
          "2 large eggs",
          "50g pecorino cheese",
          "2 cloves garlic",
          "Salt and black pepper"
        ],
        instructions: "1. Cook spaghetti according to package instructions. 2. In a pan, cook pancetta with garlic until crispy. 3. In a bowl, whisk eggs and cheese together. 4. Drain spaghetti, then mix with pancetta. 5. Remove from heat and stir in egg mixture. 6. Season with salt and pepper to taste."
    ),
    Recipe(
        title: "Chicken Salad",
        ingredients: [
          "2 cooked chicken breasts, shredded",
          "1 cup celery, diced",
          "1/2 cup red onion, diced",
          "1/2 cup mayonnaise",
          "1 tablespoon lemon juice",
          "Salt and pepper to taste"
        ],
        instructions: "1. In a bowl, combine chicken, celery, and red onion. 2. In a separate bowl, mix mayonnaise and lemon juice. 3. Combine with chicken mixture. 4. Season with salt and pepper. 5. Chill before serving."
    )
  ];

  List<Recipe> get recipes => _recipes;

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }
}
