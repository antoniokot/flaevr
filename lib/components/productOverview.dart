import 'package:flaevr/components/allergens.dart';
import 'package:flaevr/components/badges.dart';
import 'package:flaevr/components/gaugeChart.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class ProductOverview extends StatelessWidget {
  final bool animate;
  final ProductModel product;
  final Color color;

  ProductOverview(this.product, {this.animate, this.color});

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
        Badges(this.product.id),
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
                      child: GaugeChart(30.0,
                          color: color, animate: this.animate)),
                  Text("8/10"),
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
                    child:
                        GaugeChart(60.0, color: color, animate: this.animate),
                  ),
                  Text("8/10"),
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
                    child:
                        GaugeChart(80.0, color: color, animate: this.animate),
                  ),
                  Text("8/10"),
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
        Allergens()
      ],
    );
  }
}
