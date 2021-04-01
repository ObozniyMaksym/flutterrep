import 'package:flutter/material.dart';
import 'package:forsale/main.dart';
import 'package:forsale/screens/add_discount.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override 
  Widget build(BuildContext context) {
    return AppBar(title: Text('Hello, Maksym'), actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.publish_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDiscountScreen()),
              );
            }),
        ElevatedButton(
          onPressed: () {
            context.read<AuthenticationService>().signOut();
            Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AuthenticationWrapper(),
      ),
      (route) => false,
    );
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((_) => Colors.teal[400]),
          ),
          child: Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('Sign Out'))),
        )
      ]);
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}