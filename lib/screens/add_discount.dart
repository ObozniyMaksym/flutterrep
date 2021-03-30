import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:forsale/models/category.dart';
import 'package:forsale/widgets/app_bar.dart';

class AddDiscountScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Column(
                    children: [
                      FormBuilder(
                          key: _formKey,
                          child: Column(children: [
                            FormBuilderTextField(
                                name: "description",
                                decoration:
                                    InputDecoration(labelText: "Description")),
                            FormBuilderSlider(
                                name: "discount",
                                max: 100,
                                min: 1,
                                initialValue: 20,
                                divisions: 99,
                                decoration:
                                    InputDecoration(labelText: "Discount")),
                            FormBuilderDropdown(
                                name: "category",
                                items: ccategories
                                    .map((c) => DropdownMenuItem(
                                        value: c.title,
                                        child: Text('${c.title}')))
                                    .toList(),
                                decoration: InputDecoration(
                                  labelText: "Category",
                                )),
                          ])),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState.save();
                          Map<String, dynamic> ds = _formKey.currentState.value;
                          print(ds);
                          var imageURL =
                              Gravatar("random_email@gmail.com").imageUrl();
                          print(imageURL.toString());
                          Map<String, dynamic> q = {
                            'description': ds['description'],
                            'discount': ds['discount'],
                            'category': ds['category'],
                            'imageURL': imageURL.toString(),
                            'rate': 0,
                          };
                          FirebaseFirestore.instance
                              .collection('discounts')
                              .add(q);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (_) => Colors.teal[400]),
                        ),
                        child: Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text('Upload'))),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
