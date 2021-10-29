import 'package:flaevr/components/allergens.dart';
import 'package:flaevr/components/badges.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProductOverview extends StatelessWidget {
  final bool animate;
  final ProductModel product;

  ProductOverview(this.product, {this.animate, mainColor});

  /// Creates a [PieChart] with sample data and no transition.
  factory ProductOverview.withSampleData(ProductModel p) {
    return new ProductOverview(
      p,
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double chartSize = MediaQuery.of(context).size.width / 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
          child: Row(
            children: [Text("12 selos"), Icon(Icons.more_horiz)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Badges(this.product.id),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
          child: Row(
            children: [Text("Resumo"), Icon(Icons.more_horiz)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: chartSize,
                    height: chartSize,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: 80,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 0.15,
                            sizeUnit: GaugeSizeUnit.factor,
                          )
                        ],
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.15,
                          cornerStyle: CornerStyle.bothCurve,
                          color: Color.fromARGB(30, 0, 169, 181),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                      )
                    ]),
                  ),
                  Text("8/10"),
                  Positioned(
                    bottom: 0,
                    child: Text("Saúde"),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: chartSize,
                    height: chartSize,
                  ),
                  Text("8/10"),
                  Positioned(
                    bottom: 0,
                    child: Text("Nutrientes"),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: chartSize,
                    height: chartSize,
                  ),
                  Text("8/10"),
                  Positioned(
                    bottom: 0,
                    child: Text("Meio-ambiente"),
                  ),
                ],
              ),
            ]),
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 26, right: 19, left: 19),
          child: Row(
            children: [Text("Alergênicos"), Icon(Icons.more_horiz)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Allergens()
      ],
    );
  }
}
