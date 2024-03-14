import 'package:flutter/material.dart';
import 'package:leader_board/constants/constant_colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: ConstantColors.whiteColor,
  scaffoldBackgroundColor: ConstantColors.whiteColor,
  cardColor: ConstantColors.lightCardColor,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: ConstantColors.darkPrimaryColor),
    titleMedium: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: ConstantColors.darkPrimaryColor),
    titleSmall:
        TextStyle(fontSize: 14.0, color: ConstantColors.darkPrimaryColor),
    displaySmall:
        TextStyle(fontSize: 12.0, color: ConstantColors.darkPrimaryColor),
  ),
  shadowColor: Colors.grey.shade300,
  iconTheme: const IconThemeData(
    color: ConstantColors.whiteColor,
  ),
  fontFamily: "Poppins",
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ConstantColors.whiteColor,
      onPrimary: ConstantColors.lightPrimaryColor,
      secondary: ConstantColors.lightPrimaryColor,
      onSecondary: ConstantColors.lightPrimaryColor,
      error: ConstantColors.darkButtonColor,
      onError: ConstantColors.darkButtonColor,
      background: ConstantColors.darkButtonColor,
      onBackground: ConstantColors.darkButtonColor,
      surface: ConstantColors.darkButtonColor,
      onSurface: ConstantColors.darkButtonColor),
  buttonTheme: const ButtonThemeData(
    buttonColor: ConstantColors.lightPrimaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);
