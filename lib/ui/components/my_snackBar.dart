import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/my_theme.dart';

SnackBar buildSnackBar(BuildContext context, String text) {
  return SnackBar(
    content: Text(
      text,
      style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 14),
      textAlign: TextAlign.center,
    ),
    backgroundColor: purpleLight,
    padding: const EdgeInsets.all(25),
    margin: const EdgeInsets.all(30),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
