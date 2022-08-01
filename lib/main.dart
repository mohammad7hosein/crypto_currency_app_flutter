import 'package:cripto_currency_app_flutter/constants/my_theme.dart';
import 'package:cripto_currency_app_flutter/providers/theme_provider.dart';
import 'package:cripto_currency_app_flutter/ui/components/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          darkTheme: MyTheme.darkTheme,
          theme: MyTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              appBar: AppBar(
                actions: [ThemeSwitcher()],
              ),
              body: Container(),
            ),
          ),
        );
      },
    );
  }
}
