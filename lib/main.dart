import 'package:flutter/material.dart';
import 'package:revress/splash_screen.dart';

void main() {
  runApp(const RevressApp());
}

class RevressApp extends StatelessWidget {
  const RevressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Revress Mobile",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: SplashScreen()
    );
  }
}
