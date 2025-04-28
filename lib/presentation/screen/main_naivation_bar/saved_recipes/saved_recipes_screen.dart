import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/item_card/recipe_card.dart';
import 'package:recipe_app/core/component/image/skeleton_effect.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/action/saved_recipe_action.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/state/saved_recipe_state.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipeState state;
  final void Function(SavedRecipeAction action) onAction;

  const SavedRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        surfaceTintColor: ColorStyle.white,
        backgroundColor: ColorStyle.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Saved recipe',
          style: AppTextStyles.mediumBold(color: ColorStyle.label),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    if (state.isLoading) {
      return ListView.builder(
        itemCount: 5,
        itemBuilder:
            (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: SkeletonEffect(width: double.infinity, height: 150),
            ),
      );
    }

    if (state.errorMessage.isNotEmpty) {
      return Center(
        child: Text(state.errorMessage, style: AppTextStyles.mediumBold()),
      );
    }

    return ListView.builder(
      itemCount: state.savedRecipes.length,
      itemBuilder: (context, index) {
        final recipe = state.savedRecipes[index];
        onAction(SavedRecipeAction.setRecipeCardState(recipe));
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: RecipeCard(
            recipe: recipe,
            onBookMarkTap: () {
              onAction(SavedRecipeAction.removeToggle(recipe.recipeId));
            },
          ),
        );
      },
    );
  }
}
