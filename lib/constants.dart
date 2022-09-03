import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.deepPurple;
  static const String title = 'Calculate Avarage';
  static BorderRadius radius = BorderRadius.circular(20);
  static final TextStyle textStyle = GoogleFonts.lato(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: mainColor,
  );
  static final TextStyle lessonStyle = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: mainColor,
  );
  static final TextStyle averageStyle = GoogleFonts.lato(
    fontSize: 50,
    fontWeight: FontWeight.w700,
    color: mainColor,
  );
}
