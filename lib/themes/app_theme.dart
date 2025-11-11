import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appThemeLight = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: lightSurfaceColor,
    surfaceContainer: Color(0xFFF3F3F3),
    error: errorColor,
    onPrimary: Colors.white,
    onSecondary: darkSurfaceColor,
    onSurface: Colors.black,
    onSurfaceVariant: Color(0xFF9B9B9B),
    onError: Colors.white,
  ),
);

ThemeData appThemeDark = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: darkSurfaceColor,
    surfaceContainer: Color(0xFF383838),
    error: errorColor,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onSurfaceVariant: Color(0xFF9A9A9A),
    onError: Colors.white,
  ),
);