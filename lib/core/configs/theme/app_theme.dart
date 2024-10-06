import 'package:flutter/material.dart';
import 'package:netflix_app/core/configs/theme/app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primaryColor: AppColors.background,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.white),
      titleMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.white),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.white),
      labelSmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),
    ),
  );
}
