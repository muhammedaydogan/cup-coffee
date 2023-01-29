import 'package:cup_coffee/core/constants/enum/shared_prefs_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  SharedPreferences? _preferences;

  static final CacheManager _instance = CacheManager._init();
  static CacheManager get instance => _instance;

  CacheManager._init() {
    SharedPreferences.getInstance().then((value) async {
      _preferences = await SharedPreferences.getInstance();
      // instance._preferences ??= await SharedPreferences.getInstance();
    });
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences!.clear();
      await setBoolValue(SharedPrefKeys.isFirstLaunch, true);
    }
  }

  Future<void> setStringValue(SharedPrefKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(SharedPrefKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  String? getStringValue(SharedPrefKeys key) =>
      _preferences?.getString(key.toString());

  bool? getBoolValue(SharedPrefKeys key) =>
      _preferences?.getBool(key.toString());
}
