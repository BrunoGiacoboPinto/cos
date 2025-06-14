import 'package:flutter/material.dart';

/// Primary Colors
const Color darkBlue = Color(0xFF003366);
const Color lightBlue = Color(0xFFE6F3FF);
const Color primaryBlue = Color(0xFF0066CC);

/// Secondary Colors
const Color errorRed = Color(0xFFCC0000);
const Color orange = Color(0xFFFF6600);
const Color successGreen = Color(0xFF00AA44);
const Color warningYellow = Color(0xFFFFAA00);

/// Neutral Colors
const Color darkGray = Color(0xFF343A40);
const Color lightGray = Color(0xFFF8F9FA);
const Color mediumGray = Color(0xFF6C757D);
const Color pureBlack = Color(0xFF000000);
const Color pureWhite = Color(0xFFFFFFFF);

/// Border Colors
const Color borderLight = Color(0xFFE9ECEF);
const Color borderMedium = Color(0xFFCED4DA);

final colorScheme = ColorScheme.fromSeed(
  seedColor: primaryBlue,
  brightness: Brightness.dark,
  primary: primaryBlue,
  onPrimary: pureWhite,
  secondary: orange,
  onSecondary: pureWhite,
  tertiary: successGreen,
  onTertiary: pureWhite,
  surface: pureWhite,
  onSurface: darkGray,
  surfaceContainerHighest: darkGray,
  error: errorRed,
  onError: pureWhite,
  outline: borderMedium,
  outlineVariant: borderLight,
);
