import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData laundryTheme = _kreaLaundryTheme();

ThemeData _kreaLaundryTheme() {
  final ThemeData base = ThemeData.light();
  const TextStyle txtColor = TextStyle(color: mainText);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: primaryBlue,
      secondary: disabledBlue,
      tertiary: activeBlue,
    ),
    textTheme: base.textTheme.copyWith(
      bodyLarge: txtColor,
      bodyMedium: txtColor,
      bodySmall: txtColor,
    ),
  );
}
