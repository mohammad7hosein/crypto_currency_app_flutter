import 'package:cripto_currency_app_flutter/constants/my_key.dart';
import 'package:cripto_currency_app_flutter/constants/my_theme.dart';
import 'package:cripto_currency_app_flutter/providers/details_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../constants/my_url.dart';
import '../../data/models/crypto_models/crypto_data.dart';
import '../../utils/decimal_rounder.dart';
import '../components/my_snackBar.dart';

class DetailsScreen extends StatefulWidget {
  final CryptoData item;
  final int index;

  const DetailsScreen({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Box<CryptoData> cryptoBox;

  @override
  void initState() {
    super.initState();
    cryptoBox = Hive.box(CRYPTO_BOX);
    context.read<DetailsScreenProvider>().setFavorite(widget.item.isMark);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppbar(theme),
            buildToggleSwitch(theme),
            buildChart(size),
            buildButtons(theme),
            buildMarketStatistic(theme),
          ],
        ),
      ),
    );
  }

  Padding buildToggleSwitch(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ToggleSwitch(
        initialLabelIndex: 0,
        totalSwitches: 4,
        labels: const ["24H", "1W", "1Y", "ALL"],
        cornerRadius: 20,
        activeBgColor: [theme.secondaryHeaderColor],
        activeFgColor: theme.focusColor,
        inactiveBgColor: theme.unselectedWidgetColor,
        inactiveFgColor: Colors.grey,
        radiusStyle: true,
        dividerColor: Colors.transparent,
        onToggle: (index) {},
      ),
    );
  }

  Expanded buildMarketStatistic(ThemeData theme) {
    var marketCapitalization = DecimalRounder.removePriceDecimals(
        widget.item.quotes![0].marketCapByTotalSupply);

    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.backgroundColor,
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
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Market capitalization",
                      style: theme.textTheme.labelMedium),
                  Text("\$${widget.item.circulatingSupply}",
                      style: theme.textTheme.labelLarge)
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Circulating Suply", style: theme.textTheme.labelMedium),
                  Text("\$$marketCapitalization",
                      style: theme.textTheme.labelLarge)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildChart(Size size) {
    var tokenId = widget.item.id;
    MaterialColor filterColor =
        DecimalRounder.setColorFilter(widget.item.quotes![0].percentChange24h);
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.3,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(filterColor, BlendMode.srcATop),
        child: SvgPicture.network("${MyUrl.coinChartUrl}/$tokenId.svg"),
      ),
    );
  }

  Row buildButtons(ThemeData theme) {
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
                primary: theme.secondaryHeaderColor,
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
                primary: theme.focusColor,
              ),
              onPressed: () {},
              child: Text(
                "Buy Now",
                style: GoogleFonts.ubuntu(color: theme.secondaryHeaderColor),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildAppbar(ThemeData theme) {
    var finalPrice =
        DecimalRounder.removePriceDecimals(widget.item.quotes![0].price);
    var percentChange = DecimalRounder.removePercentDecimals(
        widget.item.quotes![0].percentChange24h);
    Color percentColor = DecimalRounder.setPercentChangesColor(
        widget.item.quotes![0].percentChange24h);
    Icon percentIcon = DecimalRounder.setPercentChangesIcon(
        widget.item.quotes![0].percentChange24h);
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.secondaryHeaderColor,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: theme.focusColor,
                  ),
                ),
              ),
              Text(
                "${widget.item.name} (${widget.item.symbol})",
                style: theme.textTheme.bodySmall,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.secondaryHeaderColor,
                ),
                child: IconButton(
                  icon: Icon(
                    context.watch<DetailsScreenProvider>().isFavorite
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_outline_rounded,
                    color: theme.focusColor,
                  ),
                  onPressed: () {
                    if (widget.item.isMark) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        buildSnackBar(
                            context, "This coin removed from watchList"),
                      );
                      cryptoBox.deleteAt(widget.index);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        buildSnackBar(context, "This coin added to watchList"),
                      );
                      cryptoBox.add(widget.item);
                    }
                    widget.item.isMark = !widget.item.isMark;
                    context
                        .read<DetailsScreenProvider>()
                        .setFavorite(widget.item.isMark);
                  },
                ),
              ),
            ],
          ),
        ),
        Text(
          "\$$finalPrice",
          style: theme.textTheme.titleMedium,
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
