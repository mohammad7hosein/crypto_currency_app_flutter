import 'package:cripto_currency_app_flutter/constants/my_page.dart';
import 'package:cripto_currency_app_flutter/providers/bottom_navigation_provider.dart';
import 'package:cripto_currency_app_flutter/ui/screens/home_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/market_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/profile_screen.dart';
import 'package:cripto_currency_app_flutter/ui/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({Key? key}) : super(key: key);

  final pages = const [
    HomeScreen(),
    MarketScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          pages[context.watch<BottomNavigationProvider>().currentPage],
          Align(
            alignment: Alignment.bottomCenter,
            child: buildBottomNavBar(context),
          ),
        ],
      ),
    );
  }

  Consumer buildBottomNavBar(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<BottomNavigationProvider>(
      builder: (context, mainProvider, child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -1),
                color: theme.shadowColor,
                blurRadius: 30,
              ),
            ],
            color: theme.secondaryHeaderColor,
            borderRadius: const BorderRadius.only(
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
                  mainProvider.setCurrentPage(MyPage.Home.index);
                },
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  width: 26,
                  height: 26,
                  color: mainProvider.currentPage == MyPage.Home.index
                      ? theme.focusColor
                      : theme.disabledColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  mainProvider.setCurrentPage(MyPage.Market.index);
                },
                icon: SvgPicture.asset(
                  "assets/icons/bar_chart_1.svg",
                  width: 24,
                  height: 24,
                  color: mainProvider.currentPage == MyPage.Market.index
                      ? theme.focusColor
                      : theme.disabledColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  mainProvider.setCurrentPage(MyPage.Wallet.index);
                },
                icon: SvgPicture.asset(
                  "assets/icons/wallet_1.svg",
                  width: 24,
                  height: 24,
                  color: mainProvider.currentPage == MyPage.Wallet.index
                      ? theme.focusColor
                      : theme.disabledColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  mainProvider.setCurrentPage(MyPage.Profile.index);
                },
                icon: SvgPicture.asset(
                  "assets/icons/user.svg",
                  width: 26,
                  height: 26,
                  color: mainProvider.currentPage == MyPage.Profile.index
                      ? theme.focusColor
                      : theme.disabledColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
