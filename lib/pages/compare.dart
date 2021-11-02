import 'package:flaevr/components/compareCard.dart';
import 'package:flaevr/components/notFoundCompareCard.dart';
import 'package:flaevr/components/productCard.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/utils/compareList.dart' as globalCompareList;
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class Compare extends StatefulWidget {
  Compare({Key? key}) : super(key: key);

  @override
  CompareState createState() => CompareState();
}

class CompareState extends State<Compare> {
  List<ProductModel> compareList = globalCompareList.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Styles.sidePaddingWithVerticalSpace,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 400,
                child: compareList.length > 0
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 19,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: compareList.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ProductCard(
                              heightAspectRatio:
                                  new AspectRatio(aspectRatio: 2.3),
                              width: 140,
                              product: compareList[index],
                            ))
                    : NotFoundCompareCard(),
              )
            ]),
      ),
    );
  }
}

class ProducModel {}
