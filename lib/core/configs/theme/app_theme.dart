import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/configs/theme/app_colors.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primaryColor: AppColors.background,
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
  );
}