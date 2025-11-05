import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF7C4DFF);
  static const Color primaryLight = Color(0xFF9575CD);
  static const Color primaryDark = Color(0xFF6A3DE8);
  static const Color secondary = Color(0xFFB39DDB);

  static const Color background = Color(0xFFF8F7FC);
  static const Color backgroundLight = Color(0xFFEDE7F6);
  static const Color surface = Colors.white;

  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);

  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient primaryGradientHorizontal = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7C4DFF), background],
    stops: [0.0, 0.5],
  );

  static const LinearGradient subtleBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [surface, background],
  );

  static LinearGradient shimmerGradient = LinearGradient(
    colors: [
      primary.withValues(alpha: 0.9),
      primaryLight.withValues(alpha: 0.9),
    ],
  );
}
