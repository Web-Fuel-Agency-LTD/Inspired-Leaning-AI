import 'package:flutter/material.dart';

class ILColors {
  ILColors._();

  //App Basic Colors

  static const Color primary = Color(0xff9D44B5);
  static const Color secondary = Color(0xff72ED72);
  static const Color accent = Color(0xff4F2663);

  //Gradient Color
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xff35024E),
        Color(0xffFAE5FF),
      ]);

  //Text Colors

  static const Color textPrimary = Color(0xff141115);
  static const Color highlightText = Color(0xff72ED72);
  static const Color textSecondary = Color(0xffA0A5BD);
  static const Color textWhite = Colors.white;

  //Background Colors

  static const Color light = Color(0xffEFEFEF);
  static const Color dark = Color(0xff282A39);
  static const Color primaryBackground = Color(0xffEFEFEF);

  //Background Container Colors

  static const Color lightContainer = Color(0xffFFFFFF);
  static const Color darkContainer = Color(0xff303134);

  //Button Colors

  static const Color buttonPrimary = Color(0xff9D44B5);
  static const Color buttonSecondary = Color(0xffFFC857);
  static const Color buttonDisabled = Color(0xffA6A6A6);

  //Error and validations Colors

  static const Color error = Color(0xffEF6C63);
  static const Color success = Color(0xff72ED72);
}
