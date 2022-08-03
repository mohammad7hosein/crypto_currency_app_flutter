import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreenProvider extends ChangeNotifier {

  Future<void> saveLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_logged_in", true);
  }

}