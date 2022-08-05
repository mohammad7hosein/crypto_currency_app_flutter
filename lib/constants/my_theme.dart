import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const greyColor = Color(0xFF979797);

const purpleDark = Color(0xff7473db);
const purple = Color(0xff9375ce);
const purpleLight = Color(0xff9589dc);
const pinkDark = Color(0xffc49eb5);
const light = Color(0xffe2e3ea);
const dark = Color(0xff231f2d);
final veryLight = Colors.white.withOpacity(0.5);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  );
  return InputDecorationTheme(
    hintStyle: GoogleFonts.ubuntu(color: Colors.black38, fontSize: 15),
    prefixIconColor: Colors.black38,
    suffixIconColor: dark,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

class MyTheme {
  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      elevation: 0,
      backgroundColor: Colors.black12,
      iconTheme: IconThemeData(color: Colors.white, opacity: 0.8),
    ),
    inputDecorationTheme: inputDecorationTheme(),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      bodySmall: GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
      labelSmall: GoogleFonts.ubuntu(color: Colors.white54, fontSize: 13),
      titleSmall: GoogleFonts.ubuntu(color: Colors.black, fontSize: 12),
    ),
    unselectedWidgetColor: Colors.white70,
    primaryColorLight: Colors.black,
    scaffoldBackgroundColor: Colors.black12,
    primaryColor: Colors.blueAccent[700],
    secondaryHeaderColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, opacity: 0.8),
    ),
    inputDecorationTheme: inputDecorationTheme(),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
      bodySmall: GoogleFonts.ubuntu(color: Colors.black, fontSize: 15),
      labelSmall: GoogleFonts.ubuntu(color: Colors.black38, fontSize: 13),
      titleSmall: GoogleFonts.ubuntu(color: Colors.black, fontSize: 12),
    ),
    unselectedWidgetColor: Colors.white54,
    disabledColor: Colors.black26,
    focusColor: dark,
    scaffoldBackgroundColor: light,
    primaryColorLight: purpleLight,
    primaryColor: purple,
    primaryColorDark: purpleDark,
    secondaryHeaderColor: Colors.black12,
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
  );
}
