import 'package:communi_app/core/utils/color_manager.dart';
import 'package:communi_app/core/utils/font_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // Main colors of the app
    primaryColor: ColorManager.primary,

    // Text button theme
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      backgroundColor: ColorManager.primary50,
      textStyle: TextStyle(
          fontFamily: FontFamilyConstants.fontFamily_2,
          fontWeight: FontWeightManager.regular,
          fontSize: 24,
          color: Colors.white),
    )),

    // Text theme
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontFamily: FontFamilyConstants.fontFamily_1,
          fontSize: 64,
          color: ColorManager.primary),
      headlineMedium: TextStyle(
          fontFamily: FontFamilyConstants.fontFamily_2,
          fontSize: 40,
          color: ColorManager.primary),
      headlineSmall: TextStyle(
          fontFamily: FontFamilyConstants.fontFamily_1,
          fontSize: 40,
          color: ColorManager.primary),
      bodySmall: TextStyle(
          fontFamily: FontFamilyConstants.fontFamily_2,
          fontSize: 18,
          color: ColorManager.primary),
      bodyMedium: TextStyle(
          fontFamily: FontFamilyConstants.fontFamily_2,
          fontWeight: FontWeightManager.bold,
          fontSize: 24,
          color: Colors.black),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          fontFamily: FontFamilyConstants.fontFamily_2,
          fontWeight: FontWeightManager.regular,
          fontSize: 18,
          color: ColorManager.primary),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: 2.0,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: 2.0,
        ),
      ),
    ),
  );
}
