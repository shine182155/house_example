import 'package:shared_preferences/shared_preferences.dart';

class PrefsUtils {
  static final PrefsUtils _instance = PrefsUtils._internal();
  PrefsUtils._internal();

  SharedPreferences? _prefs;  // 可为空，延迟初始化

  Future<SharedPreferences> _getPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs!;
  }

  static Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    final prefs = await _instance._getPrefs();
    return prefs.setBool(key, value);
  }

  static Future<bool?> getBool({required String key}) async {
    var prefs  = await _instance._getPrefs();
    return prefs.getBool(key);
  }
}