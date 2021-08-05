import 'package:flaevr/components/productGrid.dart';
import 'package:flaevr/components/searchBar.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  Results({Key key}) : super(key: key);

  @override
  ResultsState createState() => ResultsState();
}

class ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 20, left: 19, right: 19),
              child: SearchBar(tipText: "Pesquise algo"),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: ProductGrid(physics: new NeverScrollableScrollPhysics()))
          ])),
    );
  }
}
