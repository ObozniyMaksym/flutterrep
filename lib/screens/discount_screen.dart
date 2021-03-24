import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:forsale/models/category.dart';
import 'package:flutter/material.dart';

class DiscountScreen extends StatefulWidget {
  final int categoryIndex;
  final int index;

  DiscountScreen({this.categoryIndex, this.index});

  @override
  _DiscountScreenState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
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
                      image: AssetImage(categories[widget.categoryIndex]
                          .discounts[widget.index]
                          .imageURL),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       FloatingActionButton(
                      
                      onPressed: () {
                        categories[widget.categoryIndex]
                            .discounts[widget.index]
                            .rate--;
                        print(categories[widget.categoryIndex]
                            .discounts[widget.index]
                            .rate);
                        return;
                      },
                      child: Icon(Icons.minimize),
                  ),  
                      Text(categories[widget.categoryIndex]
                      .discounts[widget.index]
                      .rate
                      .toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                  FloatingActionButton(
                      onPressed: () {
                        categories[widget.categoryIndex]
                            .discounts[widget.index]
                            .rate++;
                        print(categories[widget.categoryIndex]
                            .discounts[widget.index]
                            .rate);
                        return;
                      },
                      child: Icon(Icons.add)),
                    ],
                  ),                
                ],
              ),
            ),
          ],
        ));
  }
}
