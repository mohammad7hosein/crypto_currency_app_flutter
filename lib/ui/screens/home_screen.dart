import 'package:cripto_currency_app_flutter/constants/my_theme.dart';
import 'package:cripto_currency_app_flutter/providers/home_screen_provider.dart';
import 'package:cripto_currency_app_flutter/ui/components/crypto_item.dart';
import 'package:cripto_currency_app_flutter/ui/components/home_page_view.dart';
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

    final cryptoProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    cryptoProvider.getTopMarketCapsData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            HomePageView(pageController: _pageController),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  buildCryptoList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Home",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const ThemeSwitcher(),
        ],
      ),
    );
  }

  Expanded buildCryptoList() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: veryLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Text(
                    "Trending",
                    style: GoogleFonts.ubuntu(
                        fontSize: 20, fontWeight: FontWeight.bold),
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
                          return CryptoItem(items: items, index: index);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: items!.length,
                      );
                    case StateData.ERROR:
                      return Text(cryptoDataProvider.state.message);
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
