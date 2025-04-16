import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/image_roader.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/state/recipe_card_state.dart';

class RecipeCard extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  const RecipeCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final recipe = viewModel.state.recipeCardState.recipe;
    if (recipe == null) {
      return const SizedBox.shrink(); // 또는 Skeleton 등 대체 UI
    }
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Container(
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Positioned.fill(
                child:
                    recipe.thumbNailUrl.startsWith('http')
                        ? RecipeImageLoader(imageUrl: recipe.thumbNailUrl)
                        : Image.asset(recipe.thumbNailUrl, fit: BoxFit.cover),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ColorStyle.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: ColorStyle.secondary20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Color(0xFFFFAD30)),
                      SizedBox(width: 4),
                      Text(
                        recipe.rating.toString(),
                        style: AppTextStyles.smallRegular(),
                      ),
                    ],
                  ),
                ),
              ),
              // 텍스트와 하단 정보
              Positioned(
                left: 12,
                bottom: 12,
                right: 12,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 텍스트
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            recipe.title,
                            style: AppTextStyles.smallBold(
                              color: ColorStyle.white,
                            ),
                          ),

                          Text(
                            'By ${recipe.userName}',
                            style: AppTextStyles.smallRegular(
                              color: ColorStyle.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    viewModel.state.recipeCardState.isGrid
                        ? const SizedBox.shrink()
                        : Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: ColorStyle.gray4,
                              size: 17,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${recipe.time} min',
                              style: AppTextStyles.smallRegular(
                                color: ColorStyle.gray4,
                              ),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap:
                                  () => viewModel.removeToggle(recipe.recipeId),
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: ColorStyle.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  viewModel.state.recipeCardState.isSaved
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: ColorStyle.primary80,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
