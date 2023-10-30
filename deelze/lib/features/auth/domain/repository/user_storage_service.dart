import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorageService {
  UserStorageService();

  Future<void> saveAuthStatus(User? user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthorized', user != null);
  }

  Future<bool> getAuthStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isAuthorized') ?? false;
  }

  Future<bool> clearAuthStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}
