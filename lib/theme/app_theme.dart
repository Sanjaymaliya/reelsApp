import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  // ─── Light Theme ────────────────────────────────────────────────────────────
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: Colors.white,
          secondary: AppColors.primaryLight,
          onSecondary: Colors.white,
          surface: AppColors.backgroundLight,
          onSurface: AppColors.textPrimaryLight,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.backgroundLight,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.backgroundLight,
          foregroundColor: AppColors.textPrimaryLight,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: false,
        ),
        textTheme: _buildTextTheme(AppColors.textPrimaryLight, AppColors.textSecondaryLight),
      );

  // ─── Dark Theme ─────────────────────────────────────────────────────────────
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          onPrimary: Colors.white,
          secondary: AppColors.primaryDark,
          onSecondary: Colors.white,
          surface: AppColors.backgroundDark,
          onSurface: AppColors.textPrimaryDark,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.backgroundDark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.backgroundDark,
          foregroundColor: AppColors.textPrimaryDark,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: false,
        ),
        textTheme: _buildTextTheme(AppColors.textPrimaryDark, AppColors.textSecondaryDark),
      );

  // ─── Helpers ─────────────────────────────────────────────────────────────────
  static TextTheme _buildTextTheme(Color txtPrimary, Color secondary) => TextTheme(
        displayLarge: AppTextStyles.txtTitle.copyWith(color: txtPrimary),
        displayMedium: AppTextStyles.subTitle.copyWith(color: secondary),


      );
}

// ─── Theme Extension ──────────────────────────────────────────────────────────


