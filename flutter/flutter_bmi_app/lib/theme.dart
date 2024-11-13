import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pinkAccent, brightness: Brightness.light),
  dividerColor: Colors.black38,
  highlightColor: Colors.pinkAccent,
  sliderTheme: const SliderThemeData(
      activeTrackColor: Colors.black38,
      thumbColor: Colors.pinkAccent,
      inactiveTrackColor: Colors.black38,
      trackHeight: 1),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
    backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
  )),
  outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
    side: WidgetStatePropertyAll(BorderSide(color: Colors.black)),
    foregroundColor: WidgetStatePropertyAll(Colors.black),
  )),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pinkAccent, brightness: Brightness.dark),
  dividerColor: Colors.white38,
  highlightColor: Colors.pinkAccent,
  sliderTheme: const SliderThemeData(
      activeTrackColor: Colors.white38,
      thumbColor: Colors.pinkAccent,
      inactiveTrackColor: Colors.white38,
      trackHeight: 1),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
    backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
  )),
  outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
    side: WidgetStatePropertyAll(BorderSide(color: Colors.white30)),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
  )),
);
