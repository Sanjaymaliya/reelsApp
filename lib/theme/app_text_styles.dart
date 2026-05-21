import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'Poppins';

  // Display
  static const TextStyle txtTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
  );

  static const TextStyle subTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    letterSpacing: 0.2,
    height: 18 / 12
  );
}
