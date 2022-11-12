import 'package:shared_preferences/shared_preferences.dart';

abstract class SessionDataProviderKey {
  static const String _apiKey = 'api_key';
}

class SessionDataProvider {
  final sharedPreferences = SharedPreferences.getInstance();

  Future<void> setApiKey(String key) async {
    (await sharedPreferences).setString(SessionDataProviderKey._apiKey, key);
  }

  Future<String?> getApiKey() async {
    return (await sharedPreferences).getString(SessionDataProviderKey._apiKey);
  }

  Future<void> removeApiKey() async {
    (await sharedPreferences).remove(SessionDataProviderKey._apiKey);
  }
}
