import 'package:cripto_currency_app_flutter/constants/my_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenProvider extends ChangeNotifier {

  Future<void> saveLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(IS_LOGGED_IN, true);
  }

}