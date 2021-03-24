import 'package:flutter/material.dart';
import 'package:forsale/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Forsale",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF000005),
        scaffoldBackgroundColor:  Color(0xFF000005),
        accentColor: Color(0xFF010416),
      ),
      home: HomeScreen(),
    );
  }
}
