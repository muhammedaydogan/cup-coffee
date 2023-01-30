import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<Object?> navigateToPage({required String path, Object? data});
  Future<void> navigateToPageClear({required String path, Object? data});
  void navigateBack({required BuildContext context, Object? data});
}

class NavigationService extends ChangeNotifier implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  final GlobalKey<NavigatorState> _globalNavigatorKey =
      GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get globalNavigatorKey => _globalNavigatorKey;

  BuildContext? get globalCurrentContext => _globalNavigatorKey.currentContext;

  bool removeAllOldRoutes(Route<dynamic> route) {
    return false;
  }

  @override
  void navigateBack({required BuildContext? context, Object? data}) {
    if (context != null) {
      Navigator.pop(context, data);
    } else if (globalNavigatorKey.currentContext != null) {
      _globalNavigatorKey.currentState!.pop(data);
    }
  }

  @override
  Future<Object?> navigateToPage({required String path, Object? data}) async {
    // ! null check??
    var result = await _globalNavigatorKey.currentState!
        .pushNamed(path, arguments: data);
    return result;
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await _globalNavigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}
