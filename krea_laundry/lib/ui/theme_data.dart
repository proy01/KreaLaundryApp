import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData laundryTheme = _kreaLaundryTheme();

ThemeData _kreaLaundryTheme() {
  final ThemeData base = ThemeData.dark();
  // const TextStyle txtColor = TextStyle(color: mainText, fontFamily: 'roboto');
  return base.copyWith(
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: 'roboto mono',
        fontSize: 82,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 5, horizontal: 24)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )),
      ),
    ),
  );
}
