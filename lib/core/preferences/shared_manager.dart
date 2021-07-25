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
    preferences.clear();
  }

  Future<bool> saveStringValue(String key, String value) async {
    return await preferences.setString(key, value);
  }

  String? getStringValue(String key) {
    return preferences.getString(key.toString()) ?? 'null data';
  }
}
