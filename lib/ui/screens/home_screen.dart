import 'package:cripto_currency_app_flutter/constants/my_theme.dart';
import 'package:cripto_currency_app_flutter/providers/home_screen_provider.dart';
import 'package:cripto_currency_app_flutter/ui/components/crypto_item.dart';
import 'package:cripto_currency_app_flutter/ui/components/home_page_view.dart';
import 'package:cripto_currency_app_flutter/ui/components/my_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/data_source/response_model.dart';
import '../../data/models/crypto_models/crypto_data.dart';
import '../components/shimmer_effect.dart';
import '../components/theme_switcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Provider.of<HomeScreenProvider>(context, listen: false)
        .getTopMarketCapsData();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(theme),
            HomePageView(pageController: _pageController),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  buildCryptoList(theme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildAppBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Home",
            style: theme.textTheme.titleLarge,
          ),
          const ThemeSwitcher(),
        ],
      ),
    );
  }

  Expanded buildCryptoList(ThemeData theme) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    "Trending",
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<HomeScreenProvider>(
                builder: (context, cryptoDataProvider, child) {
                  switch (cryptoDataProvider.state.status) {
                    case StateData.LOADING:
                      return const ShimmerEffect();
                    case StateData.COMPLETED:
                      List<CryptoData>? items = cryptoDataProvider
                          .cryptoData.data!.cryptoCurrencyList;
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return CryptoItem(
                            item: items![index],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return MyDivider(
                              color: theme.dividerColor, margin: 15);
                        },
                        itemCount: items!.length,
                      );
                    case StateData.ERROR:
                      return Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: theme.primaryColorDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            cryptoDataProvider.getTopMarketCapsData();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Try Again",
                              style: theme.textTheme.labelLarge,
                            ),
                          ),
                        ),
                      );
                    default:
                      return const ShimmerEffect();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
