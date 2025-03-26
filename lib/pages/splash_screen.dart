import 'package:flutter/material.dart';
import 'package:ios_f_n_madridmajesticexplorer_3205/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/splash_screen.png',
            fit: BoxFit.fill,
          ),
        ),
        const Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox.shrink()
        ),
      ],
    );
  }
}
