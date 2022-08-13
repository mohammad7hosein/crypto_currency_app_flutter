import 'package:cripto_currency_app_flutter/constants/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../constants/my_url.dart';
import '../../data/models/crypto_models/crypto_data.dart';
import '../../utils/decimal_rounder.dart';

class DetailsScreen extends StatelessWidget {
  final CryptoData item;

  const DetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppbar(context),
            buildToggleSwitch(),
            buildChart(size),
            buildButtons(context),
            buildMarketStatistic(context),
          ],
        ),
      ),
    );
  }

  Padding buildToggleSwitch() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ToggleSwitch(
        initialLabelIndex: 0,
        totalSwitches: 4,
        labels: const ["24H", "1W", "1Y", "ALL"],
        cornerRadius: 20,
        activeBgColor: const [Colors.white],
        activeFgColor: Colors.black,
        inactiveBgColor: testLight,
        inactiveFgColor: Colors.grey,
        radiusStyle: true,
        dividerColor: Colors.transparent,
        onToggle: (index) {},
      ),
    );
  }

  Expanded buildMarketStatistic(BuildContext context) {
    var marketCapitalization = DecimalRounder.removePriceDecimals(
        item.quotes![0].marketCapByTotalSupply);

    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: veryLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Market Statistic",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Market capitalization",
                      style: Theme.of(context).textTheme.labelMedium),
                  Text("\$${item.circulatingSupply}",
                      style: Theme.of(context).textTheme.labelLarge)
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Circulating Suply",
                      style: Theme.of(context).textTheme.labelMedium),
                  Text("\$$marketCapitalization",
                      style: Theme.of(context).textTheme.labelLarge)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildChart(Size size) {
    var tokenId = item.id;
    MaterialColor filterColor =
        DecimalRounder.setColorFilter(item.quotes![0].percentChange24h);
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.3,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(filterColor, BlendMode.srcATop),
        child: SvgPicture.network("${MyUrl.coinChartUrl}/$tokenId.svg"),
      ),
    );
  }

  Row buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                primary: Colors.white,
              ),
              onPressed: () {},
              child: Text(
                "Set Alert",
                style: GoogleFonts.ubuntu(color: purpleDark),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                primary: Theme.of(context).focusColor,
              ),
              onPressed: () {},
              child: Text(
                "Buy Now",
                style: GoogleFonts.ubuntu(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildAppbar(BuildContext context) {
    var finalPrice = DecimalRounder.removePriceDecimals(item.quotes![0].price);
    var percentChange =
        DecimalRounder.removePercentDecimals(item.quotes![0].percentChange24h);
    Color percentColor =
        DecimalRounder.setPercentChangesColor(item.quotes![0].percentChange24h);
    Icon percentIcon =
        DecimalRounder.setPercentChangesIcon(item.quotes![0].percentChange24h);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Theme.of(context).focusColor,
                  ),
                ),
              ),
              Text(
                "${item.name} (${item.symbol})",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.bookmark_outline_rounded,
                    color: Theme.of(context).focusColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Text(
          "\$$finalPrice",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            percentIcon,
            Text(
              "$percentChange%",
              style: GoogleFonts.ubuntu(color: percentColor, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }
}
