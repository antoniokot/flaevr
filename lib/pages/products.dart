import 'package:flaevr/components/productGrid.dart';
import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/models/ProductModel.dart';

class Products extends StatefulWidget {
  Products({Key? key, required this.folder}) : super(key: key);

  final Folder folder;

  @override
  ProductsState createState() => ProductsState();
}

class ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: FutureBuilder<List<ProductModel>?>(
          future: ProductService.getAllProductsInFolder(this.widget.folder.id),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ProductGrid(
                  physics: new NeverScrollableScrollPhysics(),
                  built: true,
                  products: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return ProductGrid(
                physics: new NeverScrollableScrollPhysics(),
                built: false,
                products: []);
          },
        ));
  }
}
