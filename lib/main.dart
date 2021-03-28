import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/category.dart';
import 'package:forsale/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async{
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
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
        //scaffoldBackgroundColor: Color(0xFF000005),
        accentColor: Color(0xFF010416),
      ),
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
