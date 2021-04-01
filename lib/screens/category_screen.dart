import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:forsale/models/category.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/discount.dart';
import 'package:forsale/widgets/app_bar.dart';
import 'package:forsale/widgets/discount_widget.dart';

List<Discount> makeList(var snapshot) {
  print("12134324324354");
  List<Discount> res = [];
  snapshot.docs.forEach((doc) {
    Discount discount = Discount(
      rate: doc['rate'],
      imageURL: doc['imageURL'],
      description: doc['description'],
      discount: doc['discount'], 
      category: doc['category'],
      title: doc['title'],
      id: doc.id,
    );
    print(discount.id);
    //print(snapshot);
    res.add(discount);
    
  });
  return res;
}

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
                    else {
                          List<Discount> discounts = makeList(snapshot.data);
                          print("tst");
                          print(discounts);
                          return DiscountWidget(discounts: discounts);
                    }
                  }))
        ],
      ),
    );
  }
}
