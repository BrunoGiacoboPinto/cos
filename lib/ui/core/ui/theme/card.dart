import 'package:flutter/material.dart';

import 'colors.dart';
import 'spacing.dart';

final cardTheme = CardThemeData(
  color: pureWhite,
  shadowColor: pureBlack.withValues(alpha: 0.1),
  elevation: 2.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    side: const BorderSide(color: borderLight),
  ),
  margin: const EdgeInsets.all(spaceSm),
);
