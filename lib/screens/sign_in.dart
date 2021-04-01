import 'package:flutter/material.dart';
import 'package:forsale/forms/sign_in_form.dart';


class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children:[
            Text("Sign In", style: TextStyle(fontSize: 35, color: Colors.teal[400]), textAlign: TextAlign.center),
            SignInForm()
            ]),
        );
  }
}
