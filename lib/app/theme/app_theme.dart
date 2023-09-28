import 'package:flutter/material.dart';

const double kDeffaultPadding = 16;
const double kLargePadding = 40;
const double kSmallPadding = 8;

const kColorIncome = Colors.green;
const kColorExpanse = Colors.red;

const double kSmallRadius = 8;
const double kDeffaultRadius = 16;

class AppTheme {
  AppTheme._();
  static final ThemeData themeData = ThemeData(
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kSmallPadding),
      ),
    ),
  );
}
