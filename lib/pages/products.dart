import 'package:flaevr/components/productGrid.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  ProductsState createState() => ProductsState();
}

class ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
        ),
        ProductGrid(physics: new NeverScrollableScrollPhysics())
      ])),
    );
  }
}
