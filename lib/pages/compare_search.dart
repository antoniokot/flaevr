import 'package:flaevr/components/notFound.dart';
import 'package:flaevr/components/product/productCard.dart';
import 'package:flaevr/components/searchBar.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/utils/styles.dart';

class CompareSearch extends StatefulWidget {
  CompareSearch({Key? key}) : super(key: key);

  @override
  CompareSearchState createState() => CompareSearchState();
}

class CompareSearchState extends State<CompareSearch> {
  Future<List<ProductModel>?>? products;

  // mudar depois para pesquisa por nome
  void getProducts() async {
    this.products = ProductService.getAllProducts();
    setState(() {});
  }

  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                    padding: Styles.sidePadding,
                    child: SearchBar(tipText: "Pesquise algo")),
                SizedBox(height: 20),
                SizedBox(
                  height: 250,
                  child: FutureBuilder<List<ProductModel>?>(
                    future: products,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == null || snapshot.data!.length == 0)
                          return NotFound(text: "Que vazio!");
                        else {
                          return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 19,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                              itemCount: snapshot.data!.length,
                              padding: EdgeInsets.only(top: 20),
                              itemBuilder: (BuildContext context, int index) =>
                                  ProductCard(
                                    heightAspectRatio:
                                        new AspectRatio(aspectRatio: 1.4),
                                    width: 140,
                                    product: snapshot.data![index],
                                  ));
                        }
                      } else if (snapshot.hasError) {
                        return NotFound(text: "Que vazio!");
                      }
                      // By default, show a loading skeleton.
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int index) =>
                              Skeleton(
                                width: 140,
                                height: 240,
                                padding: EdgeInsets.all(12),
                                radius: 16,
                              ));
                    },
                  ), //gridview do favorites
                )
              ],
            ),
          )),
    );
  }
}
