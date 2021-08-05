import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  static SharedManager? _instance;

  static SharedManager get instance {
    if (_instance == null) {
      _instance = SharedManager._init();
    }
    return _instance!;
  }

  late SharedPreferences preferences;
  SharedManager._init() {
    initPreferences();
  }

  Future<void> initPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveStringValue(String key, String value) async {
    await preferences.setString(key, value);
  }

  String getStringValue(String key) {
    return preferences.getString(key) ?? 'Null';
  }

  Future<void> saveIntValue(String key, int? value) async {
    await preferences.setInt(key, value!);
  }

  int? getIntValue(String key) {
    return preferences.getInt(key) ?? null;
  }
}
