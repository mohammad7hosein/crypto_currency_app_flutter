import 'package:cripto_currency_app_flutter/constants/my_page.dart';
import 'package:cripto_currency_app_flutter/ui/components/bottom_nav_bar.dart';
import 'package:cripto_currency_app_flutter/ui/screens/home/home_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/market_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/profile_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/watch_list_screen.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);
  final PageController _pageController = PageController(initialPage: MyPage.Home.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.compare_arrows_rounded, color: Theme.of(context).primaryColorLight,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        pageController: _pageController,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          MarketScreen(),
          ProfileScreen(),
          WatchListScreen()
        ],
      ),
    );
  }
}
