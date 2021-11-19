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
      this.built = true})
      : super(key: key);

  final List<Score?> scores;
  final List<ProductModel?> products;
  final bool built;

  Widget build(BuildContext context) {
    return built
        ? Column(children: [
            Container(
              height: 80,
              margin: Styles.sidePaddingWithVerticalSpace
                  .add(EdgeInsets.only(top: 10)),
              decoration: new BoxDecoration(
                color: Styles.ultraLightMutedGrey,
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
                    style: Styles.smallText,
                  ),
                  Row(
                    children: [
                      Container(
                          width: (MediaQuery.of(context).size.width - 100) / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(this.products[0]!.name!),
                              DataBar(max: 100, data: [scores[0]!.health])
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          ])
        : Skeleton(
            width: double.infinity,
            height: 100,
          );
  }
}
