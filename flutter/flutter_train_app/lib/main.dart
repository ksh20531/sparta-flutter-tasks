import 'package:flutter/material.dart';
import 'package:flutter_train_app/custom_theme.dart';
import 'package:flutter_train_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: HomePage());
  }
}
