import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/colors.dart';
import 'package:jiosaavn_vip/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JioSaavn UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: whiteColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
