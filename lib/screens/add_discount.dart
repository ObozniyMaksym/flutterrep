import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:forsale/models/category.dart';
import 'package:forsale/models/discount.dart';

class AddDiscountScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hello, Maksym'), actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.turned_in_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDiscountScreen()),
                );
              }),
        ]),
        body: Column(
          children: [
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: "description",
                    ),
                    FormBuilderSlider(
                      name: "discount",
                      max: 100,
                      min: 1,
                      initialValue: 20,
                      divisions: 99,
                    ),
                    FormBuilderDropdown(
                      name: "category",
                      items: ccategories
                          .map((c) => DropdownMenuItem(
                              value: c.title, child: Text('${c.title}')))
                          .toList(),
                    ),
                    ElevatedButton(
                      child: Text('Hello',
                          style: TextStyle(fontSize: 30, color: Colors.red)),
                      onPressed: () {
                        _formKey.currentState.save();
                        Map<String, dynamic> ds = _formKey.currentState.value;
                        print(ds);
                        var imageURL = Gravatar("random_email@gmail.com").imageUrl();
                        print(imageURL.toString());
                        Map<String, dynamic> q = {
                        'description':  ds['description'],
                        'discount':  ds['discount'],
                        'category':  ds['category'],
                        'imageURL': imageURL.toString(),
                        'rate': 0,
                        };
                        FirebaseFirestore.instance.collection('discounts').add(q);
                      },
                    )
                  ],
                )),
          ],
        ));
  }
}
