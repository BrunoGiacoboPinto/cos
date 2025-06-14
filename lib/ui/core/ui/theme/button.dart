import 'package:flutter/material.dart';

import 'colors.dart';
import 'spacing.dart';

final primaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: primaryBlue,
  foregroundColor: pureWhite,
  padding: const EdgeInsets.symmetric(
    horizontal: buttonPaddingHorizontal,
    vertical: buttonPaddingVertical,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6.0),
  ),
  textStyle: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  ),
  elevation: 0,
);

final secondaryButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.transparent,
  foregroundColor: primaryBlue,
  side: const BorderSide(color: primaryBlue, width: 2.0),
  padding: const EdgeInsets.symmetric(
    horizontal: 22.0,
    vertical: 10.0,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6.0),
  ),
  textStyle: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  ),
);

final ctaButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: orange,
  foregroundColor: pureWhite,
  padding: const EdgeInsets.symmetric(
    horizontal: 32.0,
    vertical: 16.0,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6.0),
  ),
  textStyle: const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  ),
  elevation: 0,
);
