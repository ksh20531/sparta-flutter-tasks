import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      border: MaterialStateOutlineInputBorder.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.5,
              ));
        }
        if (states.contains(WidgetState.error)) {
          return OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.red[100]!,
                width: 1.5,
              ));
        }

        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
              width: 1.5,
            ));
      }),
    ),
  );
}
