import 'package:cripto_currency_app_flutter/providers/market_screen_provider.dart';
import 'package:cripto_currency_app_flutter/ui/components/crypto_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data_source/response_model.dart';
import '../../data/models/crypto_models/crypto_data.dart';
import '../components/filter_box.dart';
import '../components/my_divider.dart';
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
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(theme),
            buildSearchBox(theme),
            buildFilterBoxes(context),
            buildCryptoList(theme),
          ],
        ),
      ),
    );
  }

  Expanded buildCryptoList(ThemeData theme) {
    return Expanded(
      child: Consumer<MarketScreenProvider>(
        builder: (context, cryptoDataProvider, child) {
          switch (cryptoDataProvider.state.status) {
            case StateData.LOADING:
              return const ShimmerEffect();
            case StateData.COMPLETED:
              items = cryptoDataProvider.foundList;
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CryptoItem(
                      item: items![index],
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return MyDivider(color: theme.dividerColor, margin: 15);
                  },
                  itemCount: items!.length,
                ),
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
                    cryptoDataProvider.getAllCryptoData();
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
    );
  }

  Consumer buildFilterBoxes(BuildContext context) {
    return Consumer<MarketScreenProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilterBox(
                onPressed: () {
                  provider.setFilterIndex(0);
                  provider.getAllCryptoData();
                },
                icon: Icons.star_border_rounded,
                text: "All Coins",
                color: Colors.blue,
                isSelected: provider.filterIndex == 0,
              ),
              FilterBox(
                onPressed: () {
                  provider.setFilterIndex(1);
                  provider.getTopGainersData();
                },
                icon: Icons.arrow_upward_rounded,
                text: "Top Gainers",
                color: Colors.green,
                isSelected: provider.filterIndex == 1,
              ),
              FilterBox(
                onPressed: () {
                  provider.setFilterIndex(2);
                  provider.getTopLosersData();
                },
                icon: Icons.arrow_downward_rounded,
                text: "Top Loosers",
                color: Colors.red,
                isSelected: provider.filterIndex == 2,
              ),
            ],
          ),
        );
      },
    );
  }

  Padding buildSearchBox(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1),
              color: theme.shadowColor,
              blurRadius: 30,
            ),
          ],
          color: theme.secondaryHeaderColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          style: theme.textTheme.bodySmall,
          onChanged: (value) {
            context.read<MarketScreenProvider>().configSearch(value);
          },
          cursorColor: theme.focusColor,
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

  Padding buildAppBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Row(
        children: [
          Text(
            "Market",
            style: theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
