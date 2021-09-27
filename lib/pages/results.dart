import 'package:flaevr/components/productGrid.dart';
import 'package:flaevr/components/searchBar.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flutter/material.dart';

import 'package:flaevr/services/FolderService.dart';

class Results extends StatefulWidget {
  Results({Key key}) : super(key: key);

  @override
  ResultsState createState() => ResultsState();
}

class ResultsState extends State<Results> {
  FolderService folderService = new FolderService();

  @override
  void initState() {
    super.initState();

    folderService.getAllFoldersByIdUser(1).then((map) => print(map));
  }

  @override
  Widget build(BuildContext context) {
    Future<List<ProductModel>> futureProducts;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 44, left: 19, right: 19),
              child: SearchBar(tipText: "Pesquise algo"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: FutureBuilder<List<ProductModel>>(
                future: futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ProductGrid(
                        physics: new NeverScrollableScrollPhysics(),
                        built: true);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return ProductGrid(
                      physics: new NeverScrollableScrollPhysics(),
                      built: false);
                },
              ),
            )
          ])),
    );
  }
}
