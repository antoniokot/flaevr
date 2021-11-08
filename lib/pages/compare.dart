import 'package:flaevr/components/compareCard.dart';
import 'package:flaevr/components/notFoundCompareCard.dart';
import 'package:flaevr/components/productCard.dart';
import 'package:flaevr/components/productGrid.dart';
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
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Comparação",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF3D3D4E)),
                  ),
                  IconButton(
                      onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          )),
                          builder: (context) {
                            return Container(
                              // decoration: new BoxDecoration(
                              //   color: Colors.white,
                              //   borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))
                              // ),
                              height: 400,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                            'Lista de produtos selecionados',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color(0xFF3D3D4E),
                                            ))),
                                    globalCompareList.list.length > 0
                                        ? ProductGrid(
                                            physics:
                                                new NeverScrollableScrollPhysics(),
                                            built: true,
                                            products: globalCompareList.list)
                                        : NotFoundCompareCard()
                                    //ProfilePicturePicker(id: this.user!.id!)
                                  ],
                                ),
                              ),
                            );
                          }),
                      icon: new Icon(Icons.folder_open))
                ],
              ),
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 400,
                      child: compareList.length > 0
                          ? GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
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
          ],
        ),
      ),
    );
  }
}
