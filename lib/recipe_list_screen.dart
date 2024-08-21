import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe_model.dart';
import 'recipe_detail_screen.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final recipeModel = Provider.of<RecipeModel>(context);

    // Filter recipes based on the search query
    final filteredRecipes = recipeModel.recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: RecipeSearchDelegate(
                  recipes: recipeModel.recipes,
                  onQueryChanged: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: filteredRecipes.length,
          itemBuilder: (context, index) {
            final recipe = filteredRecipes[index];
            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  recipe.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                leading: Icon(Icons.restaurant_menu, color: Colors.deepOrange),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailScreen(recipe: recipe),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here for adding new recipes
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

class RecipeSearchDelegate extends SearchDelegate {
  final List<Recipe> recipes;
  final ValueChanged<String> onQueryChanged;

  RecipeSearchDelegate({required this.recipes, required this.onQueryChanged});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredRecipes = recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredRecipes.length,
      itemBuilder: (context, index) {
        final recipe = filteredRecipes[index];
        return ListTile(
          title: Text(recipe.title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailScreen(recipe: recipe),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredRecipes = recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredRecipes.length,
      itemBuilder: (context, index) {
        final recipe = filteredRecipes[index];
        return ListTile(
          title: Text(recipe.title),
          onTap: () {
            query = recipe.title;
            showResults(context);
          },
        );
      },
    );
  }
}
