import 'package:flutter/material.dart';

/// App Shadows System - Boo Dating App
class AppShadows {
  // Private constructor to prevent instantiation
  AppShadows._();

  /// Action button shadow (transparent bubble)
  static const List<BoxShadow> actionButton = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];
}
