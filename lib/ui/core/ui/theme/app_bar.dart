import 'package:flutter/material.dart';
import 'colors.dart';

final appBarTheme = AppBarTheme(
  backgroundColor: pureWhite,
  foregroundColor: darkGray,
  elevation: 0,
  shadowColor: Colors.transparent,
  surfaceTintColor: Colors.transparent,
  titleTextStyle: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: darkGray,
  ),
  toolbarHeight: 72.0,
  shape: Border(
    bottom: BorderSide(
      color: borderLight,
      width: 1.0,
    ),
  ),
);
