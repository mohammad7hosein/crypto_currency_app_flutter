import 'package:flutter/cupertino.dart';

import '../constants/my_page.dart';

class MainProvider extends ChangeNotifier {
  int _currentPage = MyPage.Home.index;

  get currentPage => _currentPage;

  void setCurrentPage(int newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
