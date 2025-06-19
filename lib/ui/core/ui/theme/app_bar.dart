import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

final appBarTheme = AppBarTheme(
  backgroundColor: darkGray,
  elevation: 0,
  titleTextStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: lightBlue,
  ),
  centerTitle: true,
  iconTheme: IconThemeData(color: lightBlue),
  systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
    statusBarColor: darkGray,
    statusBarIconBrightness: Brightness.light,
  ),
);
