import 'package:cripto_currency_app_flutter/providers/market_screen_provider.dart';
import 'package:cripto_currency_app_flutter/ui/components/crypto_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data_source/response_model.dart';
import '../../data/models/crypto_models/crypto_data.dart';
import '../components/filter_box.dart';
import '../components/shimmer_effect.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  late TextEditingController searchController;
  late List<CryptoData>? items;

  @override
  void initState() {
    super.initState();
    context.read<MarketScreenProvider>().getAllCryptoData();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            buildSearchBox(context),
            buildFilterBoxes(context),
            buildCryptoList(),
          ],
        ),
      ),
    );
  }

  Expanded buildCryptoList() {
    return Expanded(
      child: Consumer<MarketScreenProvider>(
        builder: (context, cryptoDataProvider, child) {
          switch (cryptoDataProvider.state.status) {
            case StateData.LOADING:
              return const ShimmerEffect();
            case StateData.COMPLETED:
              items = cryptoDataProvider.cryptoData.data!.cryptoCurrencyList;
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CryptoItem(items: items, index: index);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: items!.length,
                ),
              );
            case StateData.ERROR:
              return Text(cryptoDataProvider.state.message);
            default:
              return const ShimmerEffect();
          }
        },
      ),
    );
  }

  Padding buildFilterBoxes(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterBox(
            onPressed: () {
              context.read<MarketScreenProvider>().getAllCryptoData();
            },
            icon: Icons.star_border_rounded,
            text: "All Coins",
            color: Colors.blue,
          ),
          FilterBox(
            onPressed: () {
              context.read<MarketScreenProvider>().getTopGainersData();
            },
            icon: Icons.arrow_upward_rounded,
            text: "Top Gainers",
            color: Colors.green,
          ),
          FilterBox(
            onPressed: () {
              context.read<MarketScreenProvider>().getTopLosersData();
            },
            icon: Icons.arrow_downward_rounded,
            text: "Top Loosers",
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Padding buildSearchBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          style: Theme.of(context).textTheme.bodySmall,
          onChanged: (value) {
            List<CryptoData>? searchList = [];
            for (CryptoData crypto in items!) {
              if (crypto.name!.toLowerCase().contains(value) ||
                  crypto.symbol!.toLowerCase().contains(value)) {
                searchList.add(crypto);
              }
            }
            context.read<MarketScreenProvider>().configSearch(searchList);
          },
          cursorColor: Colors.black,
          cursorRadius: const Radius.circular(10),
          decoration: const InputDecoration(
            hintText: "Search",
            suffixIcon: Icon(Icons.filter_list_rounded),
            prefixIcon: Icon(CupertinoIcons.search),
            // hintText: AppLocalizations.of(context)!.search,
          ),
        ),
      ),
    );
  }

  Padding buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Row(
        children: [
          Text(
            "Market",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
