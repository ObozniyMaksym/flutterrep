import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forsale/authentication_service.dart';
import 'package:forsale/screens/home_screen.dart';
import 'package:forsale/screens/sign_in.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)
          ),
          StreamProvider (create: (context) => context.read<AuthenticationService>().authStateChanges)
        ],
        child: MaterialApp(
          title: "Forsale",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xFF000005),
            //scaffoldBackgroundColor: Color(0xFF000005),
            accentColor: Color(0xFF010416),
          ),
          home: AuthenticationWrapper(),
        ));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    
    if (firebaseUser != null)
      return HomeScreen();
    else
      return SignInScreen();
  }
}
