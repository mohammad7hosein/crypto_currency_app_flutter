import 'package:cripto_currency_app_flutter/constants/my_key.dart';
import 'package:cripto_currency_app_flutter/constants/my_theme.dart';
import 'package:cripto_currency_app_flutter/data/models/crypto_models/crypto_data.dart';
import 'package:cripto_currency_app_flutter/data/models/crypto_models/quotes.dart';
import 'package:cripto_currency_app_flutter/providers/bottom_navigation_provider.dart';
import 'package:cripto_currency_app_flutter/providers/details_screen_provider.dart';
import 'package:cripto_currency_app_flutter/providers/home_screen_provider.dart';
import 'package:cripto_currency_app_flutter/providers/login_screen_provider.dart';
import 'package:cripto_currency_app_flutter/providers/market_screen_provider.dart';
import 'package:cripto_currency_app_flutter/providers/theme_provider.dart';
import 'package:cripto_currency_app_flutter/ui/components/main_wrapper.dart';
import 'package:cripto_currency_app_flutter/ui/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive/hive.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // status bar color
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter<CryptoData>(CryptoDataAdapter());
  Hive.registerAdapter<Quotes>(QuotesAdapter());
  Hive.openBox<CryptoData>(CRYPTO_BOX);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context) => MarketScreenProvider()),
        ChangeNotifierProvider(create: (context) => LoginScreenProvider()),
        ChangeNotifierProvider(create: (context) => DetailsScreenProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    super.dispose();
    Hive.box(CRYPTO_BOX).close();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          locale: const Locale('en', ''),
          localizationsDelegates: const [
            // AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('fa', ''), // persian, no country code
          ],
          themeMode: themeProvider.themeMode,
          darkTheme: MyTheme.darkTheme,
          theme: MyTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: Directionality(
            textDirection: TextDirection.ltr,
            child: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 50,
                      ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return const MainWrapper();
                } else {
                  return const LoginScreen();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
