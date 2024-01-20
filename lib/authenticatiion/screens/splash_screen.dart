import 'package:flutter/material.dart';
import 'package:jiosaavn_vip/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    route();
  }

  route() async {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 75,
          foregroundImage: AssetImage(
            'assets/jio_saavn.png',
          ),
        ),
      ),
    );
  }
}
