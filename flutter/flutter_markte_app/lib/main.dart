import 'package:flutter/material.dart';
import 'package:flutter_markte_app/ui/pages/chat_detail/chat_detail_page.dart';
import 'package:flutter_markte_app/ui/pages/home/home_page.dart';
import 'package:flutter_markte_app/ui/pages/join/join_page.dart';
import 'package:flutter_markte_app/ui/pages/welcome/welcome_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        highlightColor: Colors.orange,
        appBarTheme: AppBarTheme(
            centerTitle: false,
            titleTextStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            backgroundColor: WidgetStatePropertyAll(Colors.orange),
            minimumSize: WidgetStatePropertyAll(Size.fromHeight(50)),
            textStyle: WidgetStatePropertyAll(
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          border: MaterialStateOutlineInputBorder.resolveWith((states) {
            // 1. states Set 안에 WidgetState.focused가 포함되어있을 때
            if (states.contains(WidgetState.focused)) {
              return OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ));
            }
            // 2. states Set 안에 WidgetState.error가 포함되어있을 때
            if (states.contains(WidgetState.error)) {
              return OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Colors.red[100]!,
                    width: 2,
                  ));
            }
            // 3. 디폴트
            return OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                  width: 2,
                ));
          }),
        ),
      ),
      home: WelcomePage(),
    );
  }
}
