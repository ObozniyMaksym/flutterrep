import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:forsale/models/category.dart';
import 'package:forsale/widgets/app_bar.dart';

Future<dynamic> _showDialog(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Succesfully added"),
          actions: [
            TextButton(
              child: Text("Cool!"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}


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
                                name: "title",
                                validator: FormBuilderValidators.required(context, errorText: "Title cannot be empty"),
                                decoration:
                                    InputDecoration(labelText: "Title")),
                            FormBuilderTextField(
                                name: "description",
                                validator: FormBuilderValidators.required(context, errorText: "Description cannot be empty"),
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
                                validator: FormBuilderValidators.required(context, errorText: "Please choose category"),
                                
                                decoration: InputDecoration(
                                  labelText: "Category",
                                )),
                          ])),
                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () async {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                          Map<String, dynamic> ds = _formKey.currentState.value;
                          print(ds);

                          String url = ds['title'];
                          if (url.indexOf(' ') != -1)
                            url = url.substring(0, url.indexOf(' '));
                          var imageURL = "https://loremflickr.com/320/240/$url";
                          print(imageURL.toString());
                          Map<String, dynamic> q = {
                            'description': ds['description'],
                            'discount': ds['discount'],
                            'category': ds['category'],
                            'imageURL': imageURL.toString(),
                            'title': ds['title'],
                            'rate': 0,
                          };
                          await FirebaseFirestore.instance
                              .collection('discounts')
                              .add(q);
                          _showDialog(context);
                          }
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
