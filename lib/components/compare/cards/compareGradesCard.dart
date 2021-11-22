import 'package:flaevr/components/charts/dataBar.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/models/Score.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class CompareGradesCard extends StatelessWidget {
  CompareGradesCard(
      {Key? key,
      required this.products,
      required this.scores,
      this.colors,
      this.built = true})
      : super(key: key);

  final List<Score?> scores;
  final List<ProductModel?> products;
  final bool built;
  final List<Color>? colors;

  Widget build(BuildContext context) {
    return built
        ? Column(children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 38,
              margin: Styles.sidePaddingWithVerticalSpace
                  .add(EdgeInsets.only(top: 10)),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.23),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saúde",
                    style: Styles.mediumTitle,
                  ),
                  Text(
                    "Veja as notas no quesito de saúde dos produtos",
                    style: Styles.noteText,
                  ),
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, right: 20),
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                      this
                                                  .products[index]!
                                                  .name!
                                                  .split(",")[0]
                                                  .length >
                                              20
                                          ? this
                                                  .products[index]!
                                                  .name!
                                                  .split(",")[0]
                                                  .substring(0, 20) +
                                              "..."
                                          : this
                                              .products[index]!
                                              .name!
                                              .split(",")[0],
                                      style: Styles.smallText)),
                              DataBar(
                                max: 10.0,
                                width: 130,
                                data: [scores[index]!.health],
                                colors: this.colors != null
                                    ? [this.colors![index]]
                                    : [Color(0xFFFF4646)],
                              )
                            ],
                          ));
                    },
                  ))
                ],
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 38,
              margin: Styles.sidePaddingWithVerticalSpace
                  .add(EdgeInsets.only(top: 10)),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.23),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Natural",
                    style: Styles.mediumTitle,
                  ),
                  Text(
                    "Veja o quão natural um produto é",
                    style: Styles.noteText,
                  ),
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, right: 20),
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                      this
                                                  .products[index]!
                                                  .name!
                                                  .split(",")[0]
                                                  .length >
                                              20
                                          ? this
                                                  .products[index]!
                                                  .name!
                                                  .split(",")[0]
                                                  .substring(0, 20) +
                                              "..."
                                          : this
                                              .products[index]!
                                              .name!
                                              .split(",")[0],
                                      style: Styles.smallText)),
                              DataBar(
                                max: 10.0,
                                width: 130,
                                data: [scores[index]!.natural],
                                colors: this.colors != null
                                    ? [this.colors![index]]
                                    : [Color(0xFFFF4646)],
                              )
                            ],
                          ));
                    },
                  ))
                ],
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 38,
              margin: Styles.sidePaddingWithVerticalSpace
                  .add(EdgeInsets.only(top: 10)),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.23),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Embalagem",
                    style: Styles.mediumTitle,
                  ),
                  Text(
                    "Veja as notas para a sustentabilidade das embalagens dos produtos",
                    style: Styles.noteText,
                  ),
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, right: 20),
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                      this
                                                  .products[index]!
                                                  .name!
                                                  .split(",")[0]
                                                  .length >
                                              20
                                          ? this
                                                  .products[index]!
                                                  .name!
                                                  .split(",")[0]
                                                  .substring(0, 20) +
                                              "..."
                                          : this
                                              .products[index]!
                                              .name!
                                              .split(",")[0],
                                      style: Styles.smallText)),
                              DataBar(
                                max: 10.0,
                                width: 130,
                                data: [scores[index]!.environment],
                                colors: this.colors != null
                                    ? [this.colors![index]]
                                    : [Color(0xFFFF4646)],
                              )
                            ],
                          ));
                    },
                  ))
                ],
              ),
            ),
          ])
        : Skeleton(
            width: double.infinity,
            height: 100,
          );
  }
}
