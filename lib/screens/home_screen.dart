import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/category.dart';
import 'package:forsale/models/discount.dart';
import 'package:forsale/screens/add_discount.dart';
import 'package:forsale/widgets/category_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  Discount random = Discount(
    imageURL: "assets/images/burger.jpg",
    discount: 50,
    description: "Takeaway discount",
    rate: 5,
    category: "food"
  );

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
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddDiscountScreen()),
            );
            }),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 30, 5, 20),
                            child: Column(
                              children: [
                                Text(
                                    "-${widget.random.discount} OFF",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white)),
                                Spacer(),
                                Container(
                                  width: 100,
                                  child: Text(
                                      "${widget.random.description} OFF",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Image(
                            fit: BoxFit.contain,
                            image:
                                AssetImage(widget.random.imageURL),
                          ),
                        ],
                      )),
               
                  CategoryWidget()
                ],
              )),
            ]),
          );
        }));
  }
}
