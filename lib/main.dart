import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Pages/Giris/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
