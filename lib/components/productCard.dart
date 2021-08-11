import 'package:flutter/material.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'dart:async';

class ProductCard extends StatefulWidget {
  @override
  ProductCard({this.heightAspectRatio, this.width})
      : assert(heightAspectRatio != null &&
            heightAspectRatio.aspectRatio > 0 &&
            width > 0 &&
            width != null);

  final AspectRatio heightAspectRatio;
  final double width;
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
      height: (widget.heightAspectRatio.aspectRatio * widget.width),
      width: widget.width,
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
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: _mainColor),
              width: double.infinity,
              height: (widget.heightAspectRatio.aspectRatio * 16),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Almond Milk",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff3d3d4e),
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xff3d3d4e),
                      size: 13,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
