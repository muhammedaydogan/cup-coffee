import 'package:cup_coffee/core/init/notifier/theme_notifier.dart';
import 'package:get_it/get_it.dart';

import 'core/init/cache/cache_manager.dart';
import 'core/init/cache/secure_cache_manager.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CacheManager.instance);
  locator.registerLazySingleton(() => SecureCacheManager.instance);
  locator.registerLazySingleton(() => ThemeNotifier());
}
