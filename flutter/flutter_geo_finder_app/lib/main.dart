import 'package:flutter/material.dart';
import 'package:flutter_geo_finder_app/theme.dart';
import 'package:flutter_geo_finder_app/ui/home/home_page.dart';

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
      theme: AppTheme.theme,
      home: HomePage(),
    );
  }
}
