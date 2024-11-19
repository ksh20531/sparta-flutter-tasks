import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey[200],
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorSchemeSeed: Colors.grey[800],
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
