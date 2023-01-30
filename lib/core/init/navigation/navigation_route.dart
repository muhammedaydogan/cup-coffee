import 'package:flutter/material.dart';

import '../../../view/home/view/home_view.dart';
import '../../../view/splash/view/splash_view.dart';
import '../../constants/app/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> route;
    switch (settings.name) {
      case NavigationConstants.splash:
        route = navigate(const SplashView());
        break;
      case NavigationConstants.home:
        route = navigate(const HomeView());
        break;
      default:
        route = navigate(const HomeView());
    }

    return route;
  }

  PageRoute navigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
