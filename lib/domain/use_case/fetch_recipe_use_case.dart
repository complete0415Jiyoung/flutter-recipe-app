import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/roepositpry/recipe_repository.dart';

class FetchRecipeUseCase {
  final RecipeRepository _repository;

  FetchRecipeUseCase(this._repository);

  Future<List<Recipe>> execute() async {
    return _repository.getRecipes();
  }
}
