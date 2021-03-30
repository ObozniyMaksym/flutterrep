import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:forsale/models/discount.dart';

class DiscountWidget extends StatelessWidget {
  final Discount discount;
  DiscountWidget({this.discount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              Spacer(),
              Container(
                  width: 200,
                  child: Text(
                    "${discount.description}",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
