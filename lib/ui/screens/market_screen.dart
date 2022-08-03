import 'dart:async';
import 'package:cripto_currency_app_flutter/providers/market_screen_provider.dart';
import 'package:cripto_currency_app_flutter/ui/components/crypto_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/data_source/response_model.dart';
import '../../data/models/crypto_models/crypto_data.dart';
import '../components/shimmer_effect.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  late Timer timer;
  late TextEditingController searchController;
  var border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );

  @override
  void initState() {
    super.initState();

    final marketProvider =
        Provider.of<MarketScreenProvider>(context, listen: false);
    marketProvider.getCryptoData();

    timer = Timer.periodic(const Duration(seconds: 20),
        (Timer t) => marketProvider.getCryptoData());

    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Market"),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<MarketScreenProvider>(
              builder: (context, cryptoDataProvider, child) {
                switch (cryptoDataProvider.state.status) {
                  case StateData.LOADING:
                    return const ShimmerEffect();
                  case StateData.COMPLETED:
                    List<CryptoData>? items =
                        cryptoDataProvider.cryptoData.data!.cryptoCurrencyList;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            style: Theme.of(context).textTheme.bodySmall,
                            onChanged: (value) {
                              List<CryptoData>? searchList = [];
                              for (CryptoData crypto in items!) {
                                if (crypto.name!
                                        .toLowerCase()
                                        .contains(value) ||
                                    crypto.symbol!
                                        .toLowerCase()
                                        .contains(value)) {
                                  searchList.add(crypto);
                                }
                              }
                              cryptoDataProvider.configSearch(searchList);
                            },
                            controller: searchController,
                            decoration: const InputDecoration(
                              hintText: "Search here",
                              prefixIcon: Icon(
                                CupertinoIcons.search,
                              ),
                              // hintText: AppLocalizations.of(context)!.search,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CryptoItem(items: items, index: index);
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: items!.length,
                          ),
                        ),
                      ],
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
    );
  }
}
