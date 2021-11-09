import 'package:flaevr/components/dataBar.dart';
import 'package:flaevr/components/dataBarSubtitle.dart';
import 'package:flaevr/models/NutritionalQuantity.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 7, top: 20),
                child: Text(
                  "Composição",
                  style: Styles.smallTitle,
                  textAlign: TextAlign.start,
                ),
              ),
              DataBar(
                max: 200,
                isDataInPercentage: true,
                data: NutritionalCalculator.gramsCompositionPercentage(
                    200,
                    new NutritionalQuantities(
                        carbs: 120, fats: 40, proteins: 20, other: 20)),
                width: size - 38,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: DataBarSubtitle(
                  data: ["Carboidratos", "Proteínas", "Gorduras"],
                  colors: [
                    Color(0xFFFF4646),
                    Color(0xFFFF4646),
                    Color(0xFFFF4646),
                    Color(0xFFFF4646),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
