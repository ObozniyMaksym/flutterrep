import 'package:flutter/material.dart';
import 'package:forsale/authentication_service.dart';

import 'package:provider/provider.dart';
class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(emailController.text.trim(), passwordController.text.trim(),
                );
              },
              child: Text('Sign In'),
            )
          ],
        )
      );
  }

}