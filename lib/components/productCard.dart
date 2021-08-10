import 'package:flutter/material.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'dart:async';

class ProductCard extends StatefulWidget {
  @override
  ProductCard();
  @override
  ProductCardState createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  var _mainColor;

  @override
  void initState() {
    super.initState();
    getMainColors(
        new NetworkImage(
            "https://www.webpackaging.com/Up/Comp/1220/11116249/12336095-EFNGZGDX/i/prev/tetra-top-water.jpg"),
        new Size(1000, 200));
  }

  Future<void> getMainColors(NetworkImage img, Size size) async {
    await ColorGenerator.getMainColors(img, size, 1).then((value) =>
        {_mainColor = value.lightVibrantColor.color, setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 130,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.23),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  "https://m.media-amazon.com/images/I/81szW4cEfZL._SL1500_.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: _mainColor),
            width: double.infinity,
            height: 50,
            child: Row(
              children: [Text("Almond Milk")],
            ),
          )
        ],
      ),
    );
  }
}
