import '../../../core/constants/app/navigation_constants.dart';
import '../../../core/constants/enum/shared_prefs_enum.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../locator.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
part 'splash_viewmodel.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  bool isFirstTime = true;
  ThemeMode themeMode = ThemeMode.system;

  void init([Object? arguments]) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      initTheme();
      navigate();
    });
  }

  void initTheme() {
    String? themeModeIndex =
        CacheManager.instance.getStringValue(SharedPrefKeys.theme);
    if (themeModeIndex == null) return;
    themeMode = ThemeMode.values.elementAt(int.parse(themeModeIndex));
    locator<ThemeNotifier>().changeThemeMode(themeMode);
  }

  void navigate() async {
    isFirstTime =
        CacheManager.instance.getBoolValue(SharedPrefKeys.isFirstLaunch) ??
            true;

    if (isFirstTime) {
    } else {}
    NavigationService.instance
        .navigateToPageClear(path: NavigationConstants.home);
  }
}
