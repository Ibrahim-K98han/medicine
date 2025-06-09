import 'package:flutter/material.dart';
import 'package:medicine/pages/splash_screen.dart';
import 'package:medicine/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: greenColor),
      ),
      home: SplashScreen(),
    );
  }
}
