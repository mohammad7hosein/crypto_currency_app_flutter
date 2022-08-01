import 'package:cripto_currency_app_flutter/ui/screens/home_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/market_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          MarketScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
