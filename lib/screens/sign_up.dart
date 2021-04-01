import 'package:flutter/material.dart';
import 'package:forsale/forms/sign_up_form.dart';





class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children:[
            Text("Sign Up", style: TextStyle(fontSize: 35, color: Colors.teal[400]), textAlign: TextAlign.center),
            SignUpForm()
            ]),
    );
  }
}
