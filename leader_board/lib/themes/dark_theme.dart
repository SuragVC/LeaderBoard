import 'package:flutter/material.dart';
import 'package:leader_board/constants/constant_colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: ConstantColors.lightPrimaryColor,
  scaffoldBackgroundColor: ConstantColors.darkScaffoldBackgroundColor,
  cardColor: const Color.fromARGB(255, 246, 243, 243),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    titleMedium: TextStyle(
        fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
    titleSmall: TextStyle(fontSize: 14.0, color: Colors.white),
    displaySmall: TextStyle(fontSize: 12.0, color: Colors.white),
  ),
  iconTheme: const IconThemeData(
    color: ConstantColors.lightPrimaryColor,
  ),
  fontFamily: "Poppins",
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ConstantColors.lightPrimaryColor,
      onPrimary: ConstantColors.lightPrimaryColor,
      secondary: ConstantColors.lightPrimaryColor,
      onSecondary: ConstantColors.lightPrimaryColor,
      error: ConstantColors.darkButtonColor,
      onError: ConstantColors.darkButtonColor,
      background: ConstantColors.darkButtonColor,
      onBackground: ConstantColors.darkButtonColor,
      surface: ConstantColors.darkButtonColor,
      onSurface: ConstantColors.darkButtonColor),
  shadowColor: Colors.grey.shade300,
  buttonTheme: const ButtonThemeData(
    buttonColor: ConstantColors.lightPrimaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);
