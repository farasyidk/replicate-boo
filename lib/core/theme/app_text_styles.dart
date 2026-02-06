import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App Text Style System - Boo Dating App
class AppTextStyles {
  // Private constructor to prevent instantiation
  AppTextStyles._();

  // ==================== FONT FAMILY ====================
  static const String fontFamily = 'Roboto';

  // ==================== HEADING STYLES ====================

  /// H1 - Largest heading
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    height: 1.2,
  );

  /// H2 - Large heading
  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    height: 1.2,
  );

  /// H3 - Medium heading
  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 1.3,
  );

  /// H4 - Small heading
  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 1.3,
  );

  /// H5 - Smallest heading
  static const TextStyle h5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 1.3,
  );

  // ==================== BODY STYLES ====================

  /// Body Large
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    height: 1.5,
  );

  /// Body Medium
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    height: 1.5,
  );

  /// Body Small
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.gray600,
    height: 1.4,
  );

  // ==================== LABEL STYLES ====================

  /// Label Large
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    height: 1.3,
    letterSpacing: 0.5,
  );

  /// Label Medium
  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    height: 1.3,
    letterSpacing: 0.2,
  );

  /// Label Small
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.gray600,
    height: 1.3,
    letterSpacing: 0.1,
  );

  // ==================== CAPTION STYLES ====================

  /// Caption
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.gray600,
    height: 1.3,
  );

  /// Caption Small
  static const TextStyle captionSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: AppColors.gray600,
    height: 1.2,
  );
}
