import 'package:cripto_currency_app_flutter/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: IconButton(
        onPressed: () {
          themeProvider.toggleTheme();
        },
        icon: themeProvider.isDarkMode
            ? const Icon(
                CupertinoIcons.moon_fill,
                color: Colors.white,
              )
            : const Icon(
                CupertinoIcons.sun_max_fill,
                color: Colors.black,
              ),
      ),
    );
  }
}
