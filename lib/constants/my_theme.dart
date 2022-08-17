import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const purpleDark = Color(0xff7473db);
const purple = Color(0xff9375ce);
const purpleLight = Color(0xff9589dc);
const purpleVeryLight = Color(0xffddd9ff);
const pinkDark = Color(0xffc49eb5);
const light = Color(0xffe2e3ea);
final veryLight = Colors.white.withOpacity(0.5);
final lighter = Colors.white.withOpacity(0.3);
const darker = Color(0xFF202020);
const dark = Color(0xFF252525);
const darkGray = Color(0xFF303030);
const darkerGray = Color(0xFF404040);
const gray = Color(0xFF777777);
const lightGray = Color(0xFFF2F2F2);

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.transparent),
);

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
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.ubuntu(color: Colors.white54, fontSize: 15),
        prefixIconColor: Colors.white54,
        suffixIconColor: lightGray,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
        errorBorder: outlineInputBorder),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(
          color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.ubuntu(
          color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
      titleSmall: GoogleFonts.ubuntu(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      bodySmall: GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
      bodyMedium: GoogleFonts.ubuntu(color: Colors.white, fontSize: 13),
      labelSmall: GoogleFonts.ubuntu(color: Colors.white54, fontSize: 13),
      labelMedium: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white54),
      labelLarge: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
    ),
    shadowColor: Colors.black38,
    dividerColor: Colors.grey[850],
    disabledColor: gray,
    focusColor: lightGray,
    unselectedWidgetColor: darkerGray,
    secondaryHeaderColor: darkGray,
    scaffoldBackgroundColor: dark,
    backgroundColor: darker,
    primaryColorLight: purpleLight,
    primaryColor: purple,
    primaryColorDark: purpleDark,
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
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.ubuntu(color: Colors.black38, fontSize: 15),
        prefixIconColor: Colors.black38,
        suffixIconColor: dark,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
        errorBorder: outlineInputBorder),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
      titleMedium: GoogleFonts.ubuntu(
          color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
      titleSmall: GoogleFonts.ubuntu(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      bodySmall: GoogleFonts.ubuntu(color: Colors.black, fontSize: 15),
      bodyMedium: GoogleFonts.ubuntu(color: Colors.black, fontSize: 13),
      labelSmall: GoogleFonts.ubuntu(color: Colors.black38, fontSize: 13),
      labelMedium: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black38),
      labelLarge: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
    ),
    shadowColor: Colors.black26,
    dividerColor: Colors.grey[300],
    disabledColor: Colors.black26,
    focusColor: dark,
    unselectedWidgetColor: lighter,
    secondaryHeaderColor: Colors.white,
    scaffoldBackgroundColor: light,
    backgroundColor: veryLight,
    primaryColorLight: purpleLight,
    primaryColor: purple,
    primaryColorDark: purpleDark,
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
  );
}
