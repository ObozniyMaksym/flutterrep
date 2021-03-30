import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:forsale/models/category.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/discount.dart';
import 'package:forsale/screens/discount_screen.dart';
import 'package:forsale/widgets/app_bar.dart';
import 'package:forsale/widgets/discount_widget.dart';

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
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
              child: FutureBuilder(
                  future: getDiscounts,
                  builder: (context, snapshot) {
                    print(snapshot.connectionState);
                    if (!snapshot.hasData)
                      return Center(
                        child: Container(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator()),
                      );
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
                            child: DiscountWidget(discount: discount),
                          );
                        },
                      );
                  }))
        ],
      ),
    );
  }
}
