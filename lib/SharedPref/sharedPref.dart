import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // -------------- SAVING USER DATA LOCALLY ------------ //
  static Future<void> saveData(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  // -------------- SAVING USER DATA LOCALLY ------------ //
  static Future<String> getData(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future clearCache() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }
}
