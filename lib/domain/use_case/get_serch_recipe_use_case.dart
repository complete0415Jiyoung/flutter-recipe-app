import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetSerchRecipeUseCase {
  final RecipeRepository _repository;

  GetSerchRecipeUseCase({required RecipeRepository repository})
    : _repository = repository;

  Future<List<Recipe>> execute() async {
    return _repository.getSearchRecipes();
  }
}
