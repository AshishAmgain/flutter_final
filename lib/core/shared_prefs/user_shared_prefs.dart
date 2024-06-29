import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod/riverpod.dart';
final userSharedPrefsProvider = Provider<UserSharedPrefs>((ref) {
  return UserSharedPrefs();
});
class UserSharedPrefs  {
  static const String _userTokenKey = 'user_token';

  // Save user token
  Future<void> setUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userTokenKey, token);
  }

  // Retrieve user token
  Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userTokenKey);
  }

  // Remove user token
  Future<void> removeUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userTokenKey);
  }
}
