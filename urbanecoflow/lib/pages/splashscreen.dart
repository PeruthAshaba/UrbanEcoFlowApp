import 'dart:async';
import 'package:flutter/material.dart';
import 'package:urbanecoflow/pages/onboardingscreen.dart';// Make sure to adjust the import path

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/img3.png", 
              width: 200, 
              height: 200, 
            ),
            SizedBox(height: 20,), 
            Text(
              "Urban EcoFlow App",
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
