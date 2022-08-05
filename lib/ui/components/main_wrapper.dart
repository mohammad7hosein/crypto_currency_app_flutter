import 'package:cripto_currency_app_flutter/constants/my_page.dart';
import 'package:cripto_currency_app_flutter/providers/main_provider.dart';
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
      bottomNavigationBar: buildBottomNavBar(context),
      body: pages[context.watch<MainProvider>().currentPage],
    );
  }

  Consumer buildBottomNavBar(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<MainProvider>(
      builder: (context, mainProvider, child) {
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
                  mainProvider.setCurrentPage(MyPage.Home.index);
                },
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  width: 28,
                  height: 28,
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
                  width: 28,
                  height: 28,
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
                  width: 28,
                  height: 28,
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
