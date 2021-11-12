import 'package:flaevr/components/productGrid.dart';
import 'package:flaevr/pages/compare.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Results extends StatefulWidget {
  Results({Key? key, String? this.searched}) : super(key: key);

  final String? searched;

  @override
  ResultsState createState() => ResultsState();
}

class ResultsState extends State<Results> {
  List<ProductModel>? allProducts;
  String nameSearched = "";
  bool searchFieldUpdate = false;

  Future<List<ProductModel>?> getListsAsync() async {
    print("nameSearched: " + this.nameSearched);
    if (allProducts == null) {
      this.allProducts = await ProductService.getAllProducts();
      if(this.nameSearched != "")
        return this.allProducts!.where((p) => p.name!.toLowerCase().contains(this.nameSearched)).toList();
      else 
        return await ProductService.getAllProducts();
    }
    return allProducts!.where((p) => p.name!.toLowerCase().contains(this.nameSearched)).toList();
  }

  @override
  void initState() {
    super.initState();
    if(this.widget.searched != null) {
      this.nameSearched = this.widget.searched!;
    } else {
      this.nameSearched = "";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: Styles.sidePaddingWithVerticalSpace,
            child: Column(children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: IconButton(
                    icon: new Icon(Icons.arrow_back),
                    color: Color(0xFF000000),
                    onPressed: () => {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Compare(),
                        )
                      )
                    }
                ),
              ),
              Container(
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF1F1F2),
                      prefixIcon: Icon(Icons.search),
                      labelText: (){
                        if(this.widget.searched != null && !searchFieldUpdate)
                          return this.widget.searched!;
                        else  
                          return "Pesquise algo";
                      }(),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onTap: (){
                      setState(() => {
                        searchFieldUpdate = true
                      });
                    },
                    onChanged: (String value) =>
                        setState(() => {
                          this.nameSearched = value.toLowerCase(),
                        }),
                  ),
                  height: 45,
                )
              ),
              FutureBuilder<List<ProductModel>?>(
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
                      products: [],
                      physics: new NeverScrollableScrollPhysics(),
                      built: false);
                },
              ),
            ]),
          )),
    );
  }
}
