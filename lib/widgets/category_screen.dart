import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:forsale/models/category.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/discount.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2,
              child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.category.imageURL)),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.category.discounts.length,
                itemBuilder: (BuildContext context, int index) {
                  Discount discount = widget.category.discounts[index];
                  return AspectRatio(
                    aspectRatio: 2,
                    child: Image(
                      fit: BoxFit.cover,
                      height: 50,
                      image: AssetImage(discount.imageURL),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
