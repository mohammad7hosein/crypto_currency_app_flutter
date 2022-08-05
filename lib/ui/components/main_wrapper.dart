import 'package:cripto_currency_app_flutter/constants/my_page.dart';
import 'package:cripto_currency_app_flutter/ui/screens/home_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/market_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/profile_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainWrapper extends StatefulWidget {
  MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController _pageController =
      PageController(initialPage: MyPage.Home.index);

  int currentPage = MyPage.Home.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavBar(),
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          MarketScreen(),
          WalletScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }

  Container buildBottomNavBar() {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                currentPage = MyPage.Home.index;
              });
              _pageController.animateToPage(MyPage.Home.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              width: 28,
              height: 28,
              color: currentPage == MyPage.Home.index
                  ? theme.focusColor
                  : theme.disabledColor,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentPage = MyPage.Market.index;
              });
              _pageController.animateToPage(MyPage.Market.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            icon: SvgPicture.asset(
              "assets/icons/bar_chart_1.svg",
              width: 24,
              height: 24,
              color: currentPage == MyPage.Market.index
                  ? theme.focusColor
                  : theme.disabledColor,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentPage = MyPage.Wallet.index;
              });
              _pageController.animateToPage(MyPage.Wallet.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            icon: SvgPicture.asset(
              "assets/icons/wallet_1.svg",
              width: 28,
              height: 28,
              color: currentPage == MyPage.Wallet.index
                  ? theme.focusColor
                  : theme.disabledColor,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                currentPage = MyPage.Profile.index;
              });
              _pageController.animateToPage(MyPage.Profile.index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            icon: SvgPicture.asset(
              "assets/icons/user.svg",
              width: 28,
              height: 28,
              color: currentPage == MyPage.Profile.index
                  ? theme.focusColor
                  : theme.disabledColor,
            ),
          ),
        ],
      ),
    );
  }
}
