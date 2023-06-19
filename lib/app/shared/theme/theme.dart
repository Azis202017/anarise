import 'package:flutter/material.dart';
import 'color_app.dart';
import 'font.dart';

ThemeData themeData = ThemeData(
  appBarTheme:  const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: blueNormal,
      elevation: 0,
      textStyle: buttonLinkMBold.copyWith(
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: placeholder.copyWith(color: greyColor),
    border: InputBorder.none,
    outlineBorder: const BorderSide(
      color: greyColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: greyColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: greyColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: greyColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: redColor,
      ),
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: buttonLinkMBold.copyWith(
        color: blueDarker,
      ),
      elevation: 0,
      side: const BorderSide(
        color: blueNormal,
        width: 1,
        style: BorderStyle.solid,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: blueNormal,
    secondary: blueDarker,
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    unselectedItemColor: greyColor.withOpacity(0.4),
    unselectedLabelStyle: buttonLinkXSBold.copyWith(color: greyColor.withOpacity(0.5)),
    selectedLabelStyle:  buttonLinkXSBold,

  ),

);
List<BoxShadow> cardShadow = [
  const BoxShadow(
    spreadRadius: -4,
    blurRadius: 12,
    color: Color.fromRGBO(184, 184, 210, 0.2),
    offset: Offset(0, 8),
  )
];