import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'dart:async';

class ProductCard extends StatefulWidget {
  @override
  ProductCard(
      {required this.heightAspectRatio,
      required this.width,
      required this.product})
      : assert(heightAspectRatio.aspectRatio > 0 && width > 0);

  final AspectRatio heightAspectRatio;
  final double width;
  final ProductModel product;
  @override
  ProductCardState createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  var _mainColor;

  @override
  void initState() {
    super.initState();
    getMainColors(
        new NetworkImage(this.widget.product.pictureUrl != null
            ? this.widget.product.pictureUrl.toString()
            : "https://media.istockphoto.com/photos/doing-business-with-a-smile-picture-id1330547068?s=612x612"),
        new Size(500, 500));
  }

  Future<void> getMainColors(ImageProvider img, Size size) async {
    await ColorGenerator.getMainColors(img, size, 4).then((value) => {
          _mainColor = ColorGenerator.getColorByImportance(value)?.color,
          if (mounted) setState(() {})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.heightAspectRatio.aspectRatio * widget.width),
      width: widget.width,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: _mainColor),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Image.network(
                      this.widget.product.pictureUrl != null
                          ? this.widget.product.pictureUrl as String
                          : "https://media.istockphoto.com/photos/doing-business-with-a-smile-picture-id1330547068?s=612x612",
                      fit: BoxFit.contain,
                    )),
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  color: Colors.white),
              width: double.infinity,
              height: 65,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          this.widget.product.name!.split(',')[0],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff3d3d4e),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        this.widget.product.name!.split(',')[1],
                        style: TextStyle(
                            fontSize: 11,
                            color: Styles.mutedGrey,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(""),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xff3d3d4e),
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
