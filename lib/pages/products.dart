import 'package:flaevr/components/productGrid.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/models/ProductModel.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  ProductsState createState() => ProductsState();
}

class ProductsState extends State<Products> {
  Future<List<ProductModel>> futureProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
        ),
        FutureBuilder<List<ProductModel>>(
          future: futureProduct,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ProductGrid(
                  physics: new NeverScrollableScrollPhysics(), built: true);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return ProductGrid(
                physics: new NeverScrollableScrollPhysics(), built: false);
          },
        ),
      ])),
    );
  }
}
