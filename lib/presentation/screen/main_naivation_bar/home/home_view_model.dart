import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';

import 'package:recipe_app/domain/use_case/get_login_user_info_use_case.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/state/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetLoginUserInfoUseCase _getLoginUserInfo;
  HomeViewModel({required GetLoginUserInfoUseCase getLoginUserInfo})
    : _getLoginUserInfo = getLoginUserInfo;

  HomeState _state = HomeState();
  HomeState get state => _state;

  Future<void> getUserData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final user = await _getLoginUserInfo.execute();
    _state = state.copyWith(user: user);
    notifyListeners();
  }

  // 선택한 카테고리를 업데이트
  void updateSelectedCategory(Category category) {
    _state = state.copyWith(category: category); // 상태 업데이트
    notifyListeners(); // 상태 변경 알림
  }
}
