import 'package:flaevr/components/dataBar.dart';
import 'package:flaevr/utils/nutritionalCalculator.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class NutriData extends StatelessWidget {
  NutriData();

  @override
  Widget build(BuildContext context) {
    double maxCalories = NutritionalCalculator.EER(20, 65, 1.72, 2, 'M');
    double size = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    Styles.sidePadding.add(EdgeInsets.symmetric(vertical: 7)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Calorias",
                        style: Styles.smallTitle,
                      ),
                      Text(
                        maxCalories.toString().substring(0, 7) + "kCal",
                        style:
                            Styles.smallTitle.apply(color: Color(0xFFFF4646)),
                      ),
                    ]),
              ),
              DataBar(
                max: maxCalories,
                data: [200],
                width: size - 38,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    Styles.sidePadding.add(EdgeInsets.only(bottom: 7, top: 20)),
                child: Text(
                  "Calorias",
                  style: Styles.smallTitle,
                ),
              ),
              DataBar(
                max: 85,
                data: [53, 16, 7.9],
                width: size - 38,
              ),
            ],
          )
        ],
      ),
    );
  }
}
