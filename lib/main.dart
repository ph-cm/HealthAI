import 'package:flutter/material.dart';
import 'screens/splash_page.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthAI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFC793CF),
        fontFamily: 'Roboto',
      ),
      home: SplashPage(), 
    );
  }
}
