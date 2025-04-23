import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/example_screen/preview_main.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/home_screen_root.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/home_view_model.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/main_navigation_bar.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/profile/profile_screen.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_screen_root.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/recipe_detail_screen_root.dart';
import 'package:recipe_app/presentation/screen/search_recipes/search_recipes_screen_root.dart';
import 'package:recipe_app/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/screen/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/screen/splash/splash_screen.dart';

import '../../presentation/screen/main_naivation_bar/notification/notification_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    // 인증관련 화면
    GoRoute(
      path: Routes.splash,
      builder: (conttext, state) => SplashScreen(viewModel: getIt()),
    ),
    GoRoute(path: Routes.signIn, builder: (conttext, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (conttext, state) => SignUpScreen()),

    ShellRoute(
      builder: (context, state, child) {
        // 메인 네비게이션 바 반환
        return MainNavigationBar(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.home, // 홈 화면 경로
          builder: (context, state) {
            return HomeScreenRoot(viewModel: getIt());
          },
        ),
        GoRoute(
          path: Routes.savedRecipe, // 저장된 레시피 화면 경로
          builder: (context, state) {
            return SavedRecipesScreenRoot(viewModel: getIt());
          },
        ),
        GoRoute(
          path: Routes.notification, // 알림 화면 경로
          builder: (context, state) => NotificationScreen(),
        ),
        GoRoute(
          path: Routes.profile, // 프로필 화면 경로
          builder: (context, state) => ProfileScreen(),
        ),
      ],
    ),

    // 상태 유지
    StatefulShellRoute.indexedStack(
      builder: (
        context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return navigationShell;
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.search,
              builder:
                  (context, state) =>
                      SearchRecipesScreenRoot(viewModel: getIt()),
            ),
          ],
        ),
      ],
    ),

    // 레시피 상세화면
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) {
        final recipeId = state.pathParameters['recipeId'];
        return RecipeDetailScreenRoot(
          recipeId: int.parse(recipeId!),
          viewModel: getIt(),
        );
      },
    ),
    // 예시화면
    GoRoute(path: Routes.example, builder: (conttext, state) => PreviewMain()),
  ],
);
