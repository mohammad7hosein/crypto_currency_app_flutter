import 'package:cached_network_image/cached_network_image.dart';
import 'package:cripto_currency_app_flutter/utils/decimal_rounder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/my_url.dart';
import '../../data/models/crypto_models/crypto_data.dart';

class CryptoItem extends StatelessWidget {
  List<CryptoData>? items;
  int index;

  CryptoItem({Key? key, required this.items, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    var tokenId = items![index].id;
    var finalPrice =
        DecimalRounder.removePriceDecimals(items![index].quotes![0].price);
    var percentChange = DecimalRounder.removePercentDecimals(
        items![index].quotes![0].percentChange24h);
    MaterialColor filterColor = DecimalRounder.setColorFilter(
        items![index].quotes![0].percentChange24h);
    Color percentColor = DecimalRounder.setPercentChangesColor(
        items![index].quotes![0].percentChange24h);
    Icon percentIcon = DecimalRounder.setPercentChangesIcon(
        items![index].quotes![0].percentChange24h);

    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: size.height * 0.07,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 500),
                width: 32,
                height: 32,
                imageUrl: "${MyUrl.coinSymbolUrl}/$tokenId.png",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
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
                    items![index].name.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    items![index].symbol.toString(),
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
