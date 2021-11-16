import 'package:flaevr/components/allergens.dart';
import 'package:flaevr/components/badges.dart';
import 'package:flaevr/components/gaugeChart.dart';
import 'package:flaevr/models/Composition.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/services/AllergensService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class ProductOverview extends StatefulWidget {
  const ProductOverview(this.product,
      {required this.animate, required this.color, this.ingredients});

  final bool animate;
  final ProductModel product;
  final Color color;
  final Composition? ingredients;

  @override
  ProductOverviewState createState() => ProductOverviewState();
}

class ProductOverviewState extends State<ProductOverview> {
  List<double> scores = [];

  @override
  void initState() {
    this.scores = [20.0, 40.0, 90.0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double chartSize = MediaQuery.of(context).size.width / 3.4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
          child: Row(
            children: [
              Text(
                "Selos",
                style: Styles.mediumTitle,
              ),
              Icon(Icons.more_horiz, color: Styles.textBlack)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Badges(id: this.widget.product.id!),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
          child: Row(
            children: [
              Text(
                "Resumo",
                style: Styles.mediumTitle,
              ),
              Icon(Icons.more_horiz, color: Styles.textBlack)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      width: chartSize,
                      height: chartSize,
                      child: GaugeChart(
                          this.scores.length > 0 ? this.scores[0] : 10.0,
                          color: widget.color,
                          animate: this.widget.animate)),
                  Text(this.scores.length > 0
                      ? (this.scores[0] / 10).toString().substring(0, 3) + "/10"
                      : "/"),
                  Positioned(
                    bottom: 0,
                    child: Text("Saúde", style: Styles.smallText),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: chartSize,
                    height: chartSize,
                    child: GaugeChart(
                        this.scores.length > 0 ? this.scores[1] : 10.0,
                        color: widget.color,
                        animate: this.widget.animate),
                  ),
                  Text(this.scores.length > 0
                      ? (this.scores[1] / 10).toString().substring(0, 3) + "/10"
                      : "/"),
                  Positioned(
                    bottom: 0,
                    child: Text("Nutrientes", style: Styles.smallText),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: chartSize,
                    height: chartSize,
                    child: GaugeChart(
                        this.scores.length > 0 ? this.scores[2] : 10.0,
                        color: widget.color,
                        animate: this.widget.animate),
                  ),
                  Text(this.scores.length > 0
                      ? (this.scores[2] / 10).toString().substring(0, 3) + "/10"
                      : "/"),
                  Positioned(
                    bottom: 0,
                    child: Text("Meio-ambiente", style: Styles.smallText),
                  ),
                ],
              ),
            ]),
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 26, right: 19, left: 19),
          child: Row(
            children: [
              Text(
                "Alergênicos",
                style: Styles.mediumTitle,
              ),
              Icon(
                Icons.more_horiz,
                color: Styles.textBlack,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Allergens(AllergenService.getListOfAllergens(
            this.widget.ingredients!.ingredients))
      ],
    );
  }
}
