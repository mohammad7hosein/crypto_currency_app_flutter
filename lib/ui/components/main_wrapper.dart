import 'package:cripto_currency_app_flutter/ui/components/bottom_nav_bar.dart';
import 'package:cripto_currency_app_flutter/ui/screens/home_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/market_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/profile_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/watch_list_screen.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.compare_arrows_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        pageController: _pageController,
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          HomeScreen(),
          MarketScreen(),
          ProfileScreen(),
          WatchListScreen()
        ],
      ),
    );
  }
}
