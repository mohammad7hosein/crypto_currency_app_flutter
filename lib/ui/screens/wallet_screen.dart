import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../constants/my_key.dart';
import '../../constants/my_theme.dart';
import '../../data/models/crypto_models/crypto_data.dart';
import '../components/crypto_item.dart';
import '../components/my_divider.dart';
import '../components/wallet_button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late Box<CryptoData> cryptoBox;

  @override
  void initState() {
    super.initState();
    cryptoBox = Hive.box(CRYPTO_BOX);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(theme),
            buildButtons(),
            buildCryptoList(theme),
          ],
        ),
      ),
    );
  }

  Padding buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          WalletButton(
            icon: Icons.arrow_upward_rounded,
            color: Colors.green,
            text: "Send",
          ),
          WalletButton(
            icon: Icons.arrow_downward_rounded,
            color: purple,
            text: "Receive",
          ),
          WalletButton(
            icon: Icons.shopping_cart_outlined,
            color: Colors.pink,
            text: "Buy",
          ),
        ],
      ),
    );
  }

  Padding buildAppBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            "Wallet",
            style: theme.textTheme.titleLarge,
          ),
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
                    "WatchList",
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: cryptoBox.listenable(),
                builder:
                    (BuildContext context, Box<CryptoData> box, Widget? child) {
                  if (box.values.isEmpty) {
                    return Center(
                      child: Text(
                        "it's empty",
                        style: theme.textTheme.titleSmall,
                      ),
                    );
                  } else {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return CryptoItem(
                          item: box.getAt(index)!,
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return MyDivider(color: theme.dividerColor, margin: 15);
                      },
                      itemCount: box.values.length,
                    );
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
