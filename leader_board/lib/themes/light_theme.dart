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
    color: ConstantColors.lightPrimaryColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: ConstantColors.lightPrimaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);
