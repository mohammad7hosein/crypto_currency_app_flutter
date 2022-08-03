import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const greyColor = Color(0xFF979797);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: greyColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: GoogleFonts.ubuntu(color: greyColor, fontSize: 15),
    prefixIconColor: greyColor,
    // contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    // focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

class MyTheme {
  static final darkTheme = ThemeData(
    inputDecorationTheme: inputDecorationTheme(),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      elevation: 0,
      backgroundColor: Colors.black12,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white, opacity: 0.8),
    ),
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
    // textSelectionTheme: TextSelectionThemeData(
    //   cursorColor: Colors.red,
    //   selectionColor: Colors.green,
    //   selectionHandleColor: Colors.blue,
    // ),
    //   colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    inputDecorationTheme: inputDecorationTheme(),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black, opacity: 0.8),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ubuntu(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      bodySmall: GoogleFonts.ubuntu(color: Colors.black, fontSize: 15),
      labelSmall: GoogleFonts.ubuntu(color: Colors.black38, fontSize: 13),
      titleSmall: GoogleFonts.ubuntu(color: Colors.black, fontSize: 12),
    ),
    unselectedWidgetColor: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blueAccent,
    secondaryHeaderColor: Colors.black12,
    iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
    // textSelectionTheme: TextSelectionThemeData(
    //   cursorColor: Colors.red,
    //   selectionColor: Colors.green,
    //   selectionHandleColor: Colors.blue,
    // ),
    //   colorScheme: ColorScheme.dark(),
  );
}
