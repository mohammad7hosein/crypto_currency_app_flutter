import 'package:cripto_currency_app_flutter/constants/my_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenProvider extends ChangeNotifier {

 bool _isLoading = false;

 bool get isLoading => _isLoading;

 set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

}