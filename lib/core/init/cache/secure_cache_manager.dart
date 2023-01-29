import 'package:cup_coffee/core/constants/enum/shared_prefs_enum.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureCacheManager {
  static SecureCacheManager? _instance = SecureCacheManager._init();
  static SecureCacheManager get instance {
    _instance ??= SecureCacheManager._init();
    return _instance!;
  }

  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  SecureCacheManager._init() {
    removeOldCache();
  }

  Future<void> removeOldCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(SharedPrefKeys.isFirstLaunch.toString()) ?? true) {
      deleteAll();
    }
  }

  Future<void> write(SharedPrefKeys key, String value) async {
    return await secureStorage.write(key: key.toString(), value: value);
  }

  Future<void> delete(SharedPrefKeys key) async {
    return await secureStorage.delete(key: key.toString());
  }

  Future<String?> read(SharedPrefKeys key) async {
    return await secureStorage.read(key: key.toString());
  }

  Future<void> deleteAll() async {
    return await secureStorage.deleteAll();
  }
}
