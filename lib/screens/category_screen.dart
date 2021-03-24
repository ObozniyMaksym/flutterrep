import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:forsale/models/category.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/discount.dart';
import 'package:forsale/screens/discount_screen.dart';

class CategoryScreen extends StatefulWidget {
  final int index;
  CategoryScreen({this.index});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: AspectRatio(
              aspectRatio: 3,
              child: Image(
                  fit: BoxFit.cover,
                  height: 20,
                  image: AssetImage(categories[widget.index].imageURL)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: categories[widget.index].discounts.length,
              itemBuilder: (BuildContext context, int index) {
                Discount discount = categories[widget.index].discounts[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DiscountScreen(
                          categoryIndex: widget.index, index: index),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 2,
                          child: Image(
                            fit: BoxFit.cover,
                            height: 50,
                            image: AssetImage(discount.imageURL),
                          ),
                        ),
                        Row(
                          children: [
                            Text("-${discount.discount} OFF",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Spacer(),
                            Container(
                              width: 200,
                                child: Text(
                              "${discount.description}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
