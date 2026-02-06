import 'package:flutter/material.dart';

/// App Color System
class AppColors {
  AppColors._();

  // ==================== NEUTRAL COLORS ====================

  /// White
  static const Color white = Color(0xFFFFFFFF);
  static const Color white08 = Color(0xCCFFFFFF);

  /// Black
  static const Color black = Color(0xFF000000);

  /// Gray Scale
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray600 = Color(0xFF757575);
  static const Color gray900 = Color(0xFF212121);

  /// Transparent
  static const Color transparent = Color(0x00000000);
  static const Color white30 = Color(0x4DFFFFFF);

  // ==================== PRIMARY COLORS ====================

  /// Primary Teal - Main brand color
  static const Color primary = Color(0xFF00BFA5);
  static const Color primary08 = Color(0xCC00BFA5);

  // ==================== SECONDARY COLORS ====================

  /// Red
  static const Color red = Color(0xFFFF5252);
  static const Color red08 = Color(0xCCFF5252);

  /// Pink
  static const Color pink = Color(0xFFFF4081);
  static const Color pink08 = Color(0xCCFF4081);

  /// Blue
  static const Color blue = Color(0xFF448AFF);

  /// Amber
  static const Color amber = Color(0xFFFFC107);

  /// Green
  static const Color green = Color(0xFF4CAF50);

  /// Gradient Overlay
  static const LinearGradient profileCardGradient = LinearGradient(
    begin: Alignment(0.0, -0.5),
    end: Alignment(0.0, 1.0),
    colors: [
      Color(0x00000000),
      Color(0xCC000000),
    ],
    stops: [0.0, 1.0],
  );
}
