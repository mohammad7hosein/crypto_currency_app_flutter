
import 'package:flutter/material.dart';

class DetailsScreenProvider extends ChangeNotifier {
  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  void setFavorite(bool value) {
    _isFavorite = value;
    notifyListeners();
  }

}