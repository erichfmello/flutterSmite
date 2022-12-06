import 'package:app/Pages/Home/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF05111E),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: "Penumbra Half Serif",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      title: 'Smite book',
      home: HomePage(),
    );
  }
}
