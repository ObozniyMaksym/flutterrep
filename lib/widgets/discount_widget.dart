import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:forsale/models/discount.dart';
import 'package:forsale/screens/discount_screen.dart';

class DiscountWidget extends StatelessWidget {
  final List<Discount> discounts;
  DiscountWidget({this.discounts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: discounts.length,
      itemBuilder: (BuildContext context, int index) {
        Discount discount = discounts[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiscountScreen(discount: discount),
                  ),
                ),
            child: Column(
              children: [
                //Text(discount.id, style: TextStyle(color: Colors.red, fontSize: 40)),
                SizedBox(height: 20),
                Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 240,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 100,
                          child: Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal[400],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 70,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.83,
                                  height: 150,
                                  child: Image.network(
                                    discount.imageURL,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                    color: Colors.blue[400],
                                    child: Text(
                                      "-${discount.discount} off",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.83,
                            child: Text(discount.description,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                          ),
                        )
                      ],
                    )),
              ],
            ));
      },
    );
  }
}
