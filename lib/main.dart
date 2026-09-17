import 'package:flutter/material.dart';
import 'package:try_me/screens/splash_screen.dart';

void main() {
   runApp( MyApp());
//17
}


 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp( home:SplashScreen() ,);
  }
}