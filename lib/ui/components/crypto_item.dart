import 'package:cached_network_image/cached_network_image.dart';
import 'package:cripto_currency_app_flutter/ui/screens/details_screen.dart';
import 'package:cripto_currency_app_flutter/utils/decimal_rounder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/my_url.dart';
import '../../data/models/crypto_models/crypto_data.dart';

class CryptoItem extends StatelessWidget {
  final CryptoData item;
  final int index;

  const CryptoItem({
    Key? key, required this.item, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var tokenId = item.id;
    var finalPrice =
        DecimalRounder.removePriceDecimals(item.quotes![0].price);
    var percentChange = DecimalRounder.removePercentDecimals(
        item.quotes![0].percentChange24h);
    MaterialColor filterColor = DecimalRounder.setColorFilter(
        item.quotes![0].percentChange24h);
    Color percentColor = DecimalRounder.setPercentChangesColor(
        item.quotes![0].percentChange24h);
    Icon percentIcon = DecimalRounder.setPercentChangesIcon(
        item.quotes![0].percentChange24h);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              item: item,
              index: index,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 500),
                width: 32,
                height: 32,
                imageUrl: "${MyUrl.coinSymbolUrl}/$tokenId.png",
                // placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline_rounded),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    item.symbol.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(filterColor, BlendMode.srcATop),
                child: SvgPicture.network("${MyUrl.coinChartUrl}/$tokenId.svg"),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$$finalPrice",
                      style: textTheme.bodySmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        percentIcon,
                        Text(
                          percentChange.length > 6
                              ? "${percentChange.substring(0, 6)}%"
                              : "$percentChange%",
                          style: GoogleFonts.ubuntu(
                              color: percentColor, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
