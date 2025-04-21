import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/screen/splash/splash_event.dart';

class SplashViewModel with ChangeNotifier {
  SplashViewModel();

  final _eventController = StreamController<SplashEvent>();
  Stream<SplashEvent> get eventStream => _eventController.stream;

  // 네트워크에러 (비행가모드시)
  void onNetworkError() {
    _eventController.add(SplashEvent.networkError('네트웨크 연결을 확인해주세요!'));
  }

  // 홈으로 이동
  void goHome() {
    _eventController.add(SplashEvent.goHome('홈으로 이동합니다.'));
  }

  void onLoad() {
    Future.delayed(const Duration(seconds: 1), () {
      onNetworkError();
    });
  }
}
