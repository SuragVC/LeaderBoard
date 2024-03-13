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
  shadowColor: Colors.grey.shade300,
  buttonTheme: const ButtonThemeData(
    buttonColor: ConstantColors.lightPrimaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);
