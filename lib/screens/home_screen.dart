import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/category.dart';
import 'package:forsale/models/discount.dart';
import 'package:forsale/widgets/category_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello, Maksym'), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.turned_in_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Random text'),
                ),
              );
            },
          )
        ]),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: Row(children: [
              Expanded(
                  child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Color(0xFF454548))),
                      child: Center(
                          child: Row(children: [
                        Icon(Icons.search, color: Colors.white, size: 25),
                        Text(
                          "Look for",
                          style: TextStyle(color: Color(0xFF454548)),
                          textAlign: TextAlign.left,
                        ),
                      ]))),
                  SizedBox(height: 30),
                  Container(
                    height: 140,
                    color: Theme.of(context).accentColor,
                    child: Text(
                      "If I have time I would add smth here",
                      style: TextStyle(color: Colors.white,),
                    ),
                  ),
                  CategoryWidget()
                ],
              )),
            ]),
          );
        }));
  }
}
