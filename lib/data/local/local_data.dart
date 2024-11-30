import 'package:salfa_game/injections.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static final LocalData _instance = LocalData._internal();

  factory LocalData() => _instance;

  LocalData._internal();

  static bool loadingActive = true;

  //! Setter Functions
  static Future<bool> setString(String key, String value) async {
    return await getIt<SharedPreferences>().setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await getIt<SharedPreferences>().setBool(key, value);
  }

  static Future<bool> remove(String key) async {
    return await getIt<SharedPreferences>().remove(key);
  }

  static Future<bool> clear() async {
    return await getIt<SharedPreferences>().clear();
  }

  static List<String> get allPlayers {
    return getIt<SharedPreferences>().getStringList(LocalKeys.players) ?? [];
  }
}

class LocalKeys {
  static String players = 'PLAYERS';
}
