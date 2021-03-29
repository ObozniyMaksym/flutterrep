import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forsale/models/category.dart';
import 'package:forsale/screens/category_screen.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = "https://www.youtube.com/watch?v=mueGJ79oke8";

void _launch() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

class CategoryWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  Future getCategories;
  @override
  void initState() {
    super.initState();
    getCategories = _getCategories();
  }

  _getCategories() async {
    return await FirebaseFirestore.instance.collection('categories').get();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      
      Row(children: <Widget>[
        Text('Categories',
            style: TextStyle(color: Colors.purpleAccent, fontSize: 30)),
        Spacer(),
        GestureDetector(
            onTap: _launch,
            child: Text("See all",
                style: TextStyle(color: Colors.purpleAccent, fontSize: 30)))
      ]),
      Container(
        height: 300,
        child: FutureBuilder(
            future: getCategories,
            builder: (context, snapshot) {
              print(snapshot.error);
              if (!snapshot.hasData)
                return Container(color: Colors.blue);
              else
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Category category = Category(
                    discounts: foodDiscounts,
                    title: snapshot.data.docs[index]['title'],
                    imageURL: snapshot.data.docs[index]['imageURL'],
                  );
                  return GestureDetector(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CategoryScreen(category: category),
                            ),
                          ),
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        width: 210.0,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom: 15.0,
                              child: Container(
                                height: 120.0,
                                width: 200.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${category.discounts.length} discounts',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      height: 180.0,
                                      width: 180.0,
                                      image: AssetImage(category.imageURL),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    left: 10.0,
                                    bottom: 10.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "",
                                          //category.title,
                                          style: TextStyle(
                                            color: Colors.green[400],
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              FontAwesomeIcons.locationArrow,
                                              size: 10.0,
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                            SizedBox(width: 5.0),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                },
              );
            }),
      )
      //)
    ]);
  }
}
