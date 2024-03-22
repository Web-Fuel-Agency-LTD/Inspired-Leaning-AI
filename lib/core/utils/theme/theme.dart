import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_field.dart';
import 'custom_themes/text_theme.dart';

class ILAppTheme {
  ILAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cabin',
    brightness: Brightness.light,
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ILTextTheme.lightTextTheme,
    appBarTheme: ILAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: ILBottomSheetTheme.lightBottomSheeteTheme,
    elevatedButtonTheme: ILElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: ILTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cabin',
    brightness: Brightness.dark,
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.black,
    textTheme: ILTextTheme.darkTextTheme,
    appBarTheme: ILAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: ILBottomSheetTheme.darkBottomSheeteTheme,
    elevatedButtonTheme: ILElevatedButtonTheme.darktElevatedButtonTheme,
    inputDecorationTheme: ILTextFormFieldTheme.darkInputDecorationTheme
  );

}