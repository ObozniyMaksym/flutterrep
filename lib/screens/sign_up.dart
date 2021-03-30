import 'package:flutter/material.dart';
import 'package:forsale/authentication_service.dart';
import 'package:forsale/screens/home_screen.dart';

import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
              ),
              TextField(
                controller: password2Controller,
                decoration: InputDecoration(labelText: "Repeat password"),
              ),
            ]),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            print(emailController.text.trim());
            context.read<AuthenticationService>().signUp(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
            context.read<AuthenticationService>().signIn(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
         style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (_) => Colors.teal[400]),
                ),
                child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text('Sign Up'))),
        ),
      ],
    ));
  }
}
