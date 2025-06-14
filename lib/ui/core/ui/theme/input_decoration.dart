import 'package:flutter/material.dart';

import 'colors.dart';
import 'spacing.dart';

final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: pureWhite,
  contentPadding: const EdgeInsets.all(inputPadding),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(color: borderMedium),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(color: borderMedium),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(color: primaryBlue, width: 2.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(color: errorRed),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(color: errorRed, width: 2.0),
  ),
  labelStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: darkGray,
  ),
  hintStyle: const TextStyle(
    fontSize: 16.0,
    color: mediumGray,
  ),
  errorStyle: const TextStyle(
    fontSize: 14.0,
    color: errorRed,
  ),
);
