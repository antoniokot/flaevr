import 'package:flaevr/components/productGrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Results extends StatefulWidget {
  Results({Key? key}) : super(key: key);

  @override
  ResultsState createState() => ResultsState();
}

class ResultsState extends State<Results> {
  List<ProductModel>? allProducts;
  String nameSearched = "";

  Future<List<ProductModel>?> getListsAsync() async {
    if (allProducts == null) {
      this.allProducts = (await ProductService.getAllProducts())!;
      return await ProductService.getAllProducts();
    }
    return allProducts!
        .where((p) => p.name!.toLowerCase().contains(this.nameSearched!))
        .toList();
  }

  @override
  void initState() {
    super.initState();

    this.nameSearched = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Container(
                margin:
                    EdgeInsets.only(bottom: 10, top: 44, left: 19, right: 19),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF1F1F2),
                      prefixIcon: Icon(Icons.search),
                      labelText: this.nameSearched,
                      //labelText: "Pesquise algo",
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (String value) =>
                        setState(() => this.nameSearched = value.toLowerCase()),
                  ),
                  height: 45,
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: FutureBuilder<List<ProductModel>?>(
                future: getListsAsync(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (this.nameSearched != "") {
                      return ProductGrid(
                          products: snapshot.data!,
                          physics: new NeverScrollableScrollPhysics(),
                          built: true);
                    } else {
                      return ProductGrid(
                          products: snapshot.data!,
                          physics: new NeverScrollableScrollPhysics(),
                          built: true);
                    }
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return ProductGrid(
                      products: snapshot.data!,
                      physics: new NeverScrollableScrollPhysics(),
                      built: false);
                },
              ),
            )
          ])),
    );
  }
}
