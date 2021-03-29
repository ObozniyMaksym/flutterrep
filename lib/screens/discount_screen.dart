import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/discount.dart';

Widget _buildRate(BuildContext context, DocumentSnapshot document) {
  int curRate = document['rate'];
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    FloatingActionButton(
      onPressed: () {
        document.reference.update({
            "rate": curRate - 1,
        });
        return;
      },
      child: Icon(Icons.minimize),
    ),
    Text(curRate.toString(),
        style: TextStyle(fontSize: 30, color: Colors.black)),
    FloatingActionButton(
        onPressed: () {
        document.reference.update({
            "rate": curRate + 1,
        });
        return;
        },
        child: Icon(Icons.add)),
  ]);
}

class DiscountScreen extends StatelessWidget {
  final Discount discount;
  DiscountScreen({this.discount});

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
        body: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image(
                      height: 200,
                      image: AssetImage(discount.imageURL),
                    ),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('discounts')
                          .where('imageURL', isEqualTo: discount.imageURL)
                          .snapshots(),
                      builder: (context, snapshot) {
                        print(snapshot.hasData);
                        if (snapshot.hasData)
                          return _buildRate(context, snapshot.data.docs[0]);
                        else
                          return Container(color: Colors.red);
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
