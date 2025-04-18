import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/roepositpry/recipe_repository.dart';

class FetchRecipesUseCase {
  final RecipeRepository _repository;

  FetchRecipesUseCase(this._repository);

  Future<List<Recipe>> execute() async {
    return _repository.getRecipes();
  }
}
