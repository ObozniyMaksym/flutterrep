import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:forsale/models/discount.dart';
import 'package:forsale/widgets/app_bar.dart';

import 'package:provider/provider.dart';

import '../authentication_service.dart';

Widget _buildRate(BuildContext context, DocumentSnapshot document) {
  int curRate = document['rate'];
  User curUser = context.read<AuthenticationService>().currentUser();
  String id = curUser.uid.toString() + document.id.toString();
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    FloatingActionButton(
      onPressed: () async {
        var docLike =
            await FirebaseFirestore.instance.collection("likes").doc(id).get();

        var docDislike = await FirebaseFirestore.instance
            .collection("dislikes")
            .doc(id)
            .get();

        if (docLike.exists) {
          curRate--;
          await FirebaseFirestore.instance.collection("likes").doc(id).delete();
        }
        if (!docDislike.exists) {
          document.reference.update({
            "rate": curRate - 1,
          });
          await FirebaseFirestore.instance
              .collection('dislikes')
              .doc(id)
              .set({});
        } else {
          document.reference.update({
            "rate": curRate + 1,
          });
          await FirebaseFirestore.instance
              .collection('dislikes')
              .doc(id)
              .delete();
        }
        return;
      },
      backgroundColor: Colors.blue[400],
      child: Icon(Icons.thumb_down_alt_outlined),
    ),
    Text(curRate.toString(),
        style: TextStyle(fontSize: 30, color: Colors.black)),
    FloatingActionButton(
        onPressed: () async {
          var docLike = await FirebaseFirestore.instance
              .collection("likes")
              .doc(id)
              .get();

          var docDislike = await FirebaseFirestore.instance
              .collection("dislikes")
              .doc(id)
              .get();

          if (docDislike.exists) {
            curRate++;
            await FirebaseFirestore.instance
                .collection("dislikes")
                .doc(id)
                .delete();
          }
          if (!docLike.exists) {
            document.reference.update({
              "rate": curRate + 1,
            });
            await FirebaseFirestore.instance
                .collection('likes')
                .doc(id)
                .set({});
          } else {
            document.reference.update({
              "rate": curRate - 1,
            });
            await FirebaseFirestore.instance
                .collection('likes')
                .doc(id)
                .delete();
          }
          return;
        },
        backgroundColor: Colors.blue[400],
        child: Icon(Icons.thumb_up_alt_outlined)),
  ]);
}

class DiscountScreen extends StatelessWidget {
  final Discount discount;
  DiscountScreen({this.discount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 230,
                          width: 230,
                          child: Image.network(
                            discount.imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(children: [
                  Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.teal[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                        child: Text(
                          "Added : 01.04.2021",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )),
                  Spacer(),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('discounts')
                          .where('imageURL', isEqualTo: discount.imageURL)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData)
                          return _buildRate(context, snapshot.data.docs[0]);
                        else
                          return Center(
                            child: Container(
                                width: 100,
                                height: 100,
                                child: CircularProgressIndicator()),
                          );
                      }),
                ]),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(discount.description,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 20,
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
