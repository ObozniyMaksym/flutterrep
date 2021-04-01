import 'package:flutter/material.dart';
import 'package:forsale/authentication_service.dart';
import 'package:forsale/screens/sign_up.dart';

import 'package:provider/provider.dart';
class SignInForm extends StatelessWidget {
    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {

return Column(
      children: [
        Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
            ),
          ])),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.65,
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(context.read<AuthenticationService>().signIn(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (_) => Colors.blue[400]),
                ),
                child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text('Sign In'))),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
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
              )
            ],
          ),
        )
      ],
    );}}