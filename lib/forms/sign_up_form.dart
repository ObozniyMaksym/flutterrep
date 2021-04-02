import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:forsale/screens/sign_in.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';

dynamic _showSnackBar(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Email is already used by another user")));
}

Future<dynamic> _showDialog(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Succesfully signed up"),
          actions: [
            TextButton(
              child: Text("Cool!"),
              onPressed: () {
                Navigator.of(context).pop();

                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() {
    return _SignUpFormState();
  }
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Please enter your email";
                    if (EmailValidator.validate(value)) return null;
                    return "Incorrect e-mail";
                  }),
              TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Please enter the password";
                    if (value.length < 6)
                      return "Password should be at least 6 characters";
                    return null;
                  }),
              TextFormField(
                  obscureText: true,
                  controller: password2Controller,
                  decoration: InputDecoration(labelText: "Repeat password"),
                  validator: (value) {
                    if (value != passwordController.text)
                      return "Passwords do not match";
                    return null;
                  }),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.65,
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
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
                          child: Center(child: Text('Sign In'))),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          print("something");
                          print(emailController.text.trim());
                          context
                              .read<AuthenticationService>()
                              .signUp(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              )
                              .then((str) {
                            if (str == "Signed Up")
                              _showDialog(context);
                            else {
                              _showSnackBar(context);
                            }
                          });
                        }
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
                          child: Center(child: Text('Sign Up'))),
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
