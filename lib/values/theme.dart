import 'package:flutter/material.dart';
import 'package:wnees_demo/values/styles.dart';

import 'colors.dart' as colors;

final ThemeData appTheme = ThemeData(
    primaryColor: colors.primaryColor,
    accentColor: colors.accentColor,
    scaffoldBackgroundColor: colors.whiteColor,
    textTheme: TextTheme(headline6: textBold14),
    iconTheme: const IconThemeData(color: colors.whiteColor, size: 30.0),
    buttonTheme: ButtonThemeData(
        buttonColor: colors.textBackgroundColor,
        disabledColor: colors.textBackgroundColor));
