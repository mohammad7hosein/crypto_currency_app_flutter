import 'package:cripto_currency_app_flutter/network/response_model.dart';
import 'package:cripto_currency_app_flutter/providers/crypto_data_provider.dart';
import 'package:cripto_currency_app_flutter/ui/screens/home/components/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import '../../components/theme_switcher.dart';
import 'components/shimmer_effect.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentChoiceIndex = 0;

  final List<String> _choicesList = [
    "Top MarketCaps",
    "Top Gainers",
    "Top Losers"
  ];

  @override
  void initState() {
    super.initState();

    final cryptoProvider =
        Provider.of<CryptoDataProvider>(context, listen: false);
    cryptoProvider.getTopMarketCapData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Crypto"),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        actions: const [
          ThemeSwitcher(),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              HomePageView(pageController: _pageController),
              buildMovingText(context),
              buildBuySellButtons(),
              buildChoiceChips(context),
              SizedBox(
                height: 500,
                child: Consumer<CryptoDataProvider>(
                  builder: (context, cryptoDataProvider, child) {
                    switch (cryptoDataProvider.state.status) {
                      case StateData.LOADING:
                        return const ShimmerEffect();
                      case StateData.COMPLETED:
                        return const Text("data");
                      case StateData.ERROR:
                        return Text(cryptoDataProvider.state.message);
                      default:
                        return const Text("");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildChoiceChips(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          _choicesList.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ChoiceChip(
                label: Text(
                  _choicesList[index],
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                selectedColor: Colors.blue,
                selected: currentChoiceIndex == index,
                onSelected: (value) {
                  setState(() {
                    currentChoiceIndex = value ? index : currentChoiceIndex;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Padding buildBuySellButtons() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {},
              child: const Text("buy"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {},
              child: const Text("sell"),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildMovingText(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: Marquee(
        text: "** this is place for news in application ",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
