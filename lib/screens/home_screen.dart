import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/discount.dart';
import 'package:forsale/widgets/app_bar.dart';
import 'package:forsale/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  final Discount random = Discount(
      imageURL: "assets/images/burger.jpg",
      discount: 50,
      description: "Takeaway discount",
      rate: 5,
      category: "food");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
        child: Row(children: [
          Expanded(
              child: ListView(
            children: [
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color(0xFF454548))),
                  child: Center(
                      child: Row(children: [
                    Icon(Icons.search, color: Colors.black, size: 25),
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
                    color: Colors.teal[400],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 5, 20),
                        child: Column(
                          children: [
                            Text("-${random.discount} OFF",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)),
                            Spacer(),
                            Container(
                              width: 100,
                              child: Text("${random.description} OFF",
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
                        image: AssetImage(random.imageURL),
                      ),
                    ],
                  )),
              SizedBox(height: 10),
              CategoryWidget(),
            ],
          )),
        ]),
      ),
    );
  }
}
