import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFFFFEBF0), 
              Color(0xFFFFC1E3),
            ],
          ),
        ),
        child: Center(
          
          child: Image.asset(
            "assets/logo.png", 
            width: 350,
            height: 350,
          ),
        ),
      ),
    );
  }
}
