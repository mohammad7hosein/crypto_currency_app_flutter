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

    final cryptoProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    cryptoProvider.getTopMarketCapsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            HomePageView(pageController: _pageController),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
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
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    "Trending",
                    style: Theme.of(context).textTheme.titleSmall,
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
                          return CryptoItem(item: items![index], index: index,);
                        },
                        separatorBuilder: (context, index) {
                          return MyDivider(
                              color: Colors.grey[300]!, margin: 15);
                        },
                        itemCount: items!.length,
                      );
                    case StateData.ERROR:
                      return Center(
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           primary: Theme.of(context).focusColor,
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
                             "Retry",
                             style: GoogleFonts.ubuntu(
                                 color: Colors.white,
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold),
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
