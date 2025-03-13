import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GilroyTextStyle {
  static TextStyle style({
    String family = 'Gilroy',
    Color color = Colors.white,
    double size = 16,
    FontWeight weight = FontWeight.w600,
  }) {
    return TextStyle(
      fontFamily: family,
      color: color,
      fontWeight: weight,
      fontSize: size,
    );
  }
}

class QuickSandTextStyle {
  static TextStyle weightW500({
    Color? color,
    double? size,
  }) {
    return GoogleFonts.quicksand(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle weightW600({
    Color? color,
    double? size,
  }) {
    return GoogleFonts.quicksand(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }
}
