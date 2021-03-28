import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:forsale/models/category.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/discount.dart';
import 'package:forsale/screens/discount_screen.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  CategoryScreen({this.category});
  @override 
  State<StatefulWidget> createState() => _CategoryScreenState();
  
}

class _CategoryScreenState extends State<CategoryScreen> {
  Category category;
  Future getDiscounts;


  Future _getDiscounts() async {
    return await FirebaseFirestore.instance
        .collection('discounts')
        .where('category', isEqualTo: category.title)
        .get();
  }
  @override
  void initState() {
    super.initState();
    category = widget.category;
    getDiscounts = _getDiscounts();
  }

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
                  image: AssetImage(category.imageURL)),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: getDiscounts,
                  builder: (context, snapshot) {
                    print(snapshot.connectionState);
                    if (!snapshot.hasData)
                      return Container(
                          height: 100, width: 100, color: Colors.red);
                    else
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          Discount discount = Discount(
                            imageURL: snapshot.data.docs[index]['imageURL'],
                            discount: snapshot.data.docs[index]['discount'],
                            description: snapshot.data.docs[index]
                                ['description'],
                            rate: snapshot.data.docs[index]['rate'],
                            category: category.title,
                          );
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    DiscountScreen(discount: discount),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                              color: Colors.white,
                                              fontSize: 20)),
                                      Spacer(),
                                      Container(
                                          width: 200,
                                          child: Text(
                                            "${discount.description}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                            overflow: TextOverflow.ellipsis,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                  }))
        ],
      ),
    );
  }
}
