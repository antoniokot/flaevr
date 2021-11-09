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
          Padding(
            padding: Styles.sidePadding.add(EdgeInsets.only(top: 10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Calorias",
                        style: Styles.smallTitle,
                      ),
                      Text(
                        maxCalories.toString().substring(0, 7) + " kCal",
                        style: Styles.smallText.apply(color: Color(0xFFFF4646)),
                      ),
                    ]),
                DataBar(
                  padding: EdgeInsets.only(top: 5),
                  max: maxCalories,
                  data: [200],
                  width: size - 38,
                ),
              ],
            ),
          ),
          Padding(
              padding: Styles.sidePadding.add(EdgeInsets.only(top: 20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Composição calórica",
                          style: Styles.smallTitle,
                        ),
                        Text(
                          "388 kCal",
                          style:
                              Styles.smallText.apply(color: Color(0xFFFF4646)),
                        ),
                      ]),
                  DataBar(
                    padding: EdgeInsets.only(top: 5),
                    max: 388,
                    isDataInPercentage: false,
                    data: NutritionalCalculator.caloriesPercentage(
                            388, 53.0, 16.0, 7.9)
                        .toDoubleList(),
                    width: size - 38,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: DataBarSubtitle(
                      data: ["Carboidratos", "Proteínas", "Gorduras", "Outros"],
                      colors: [
                        Color(0xFFFF4646),
                        Color(0xFFFF4646),
                        Color(0xFFFF4646),
                        Styles.lightMutedGrey,
                      ],
                    ),
                  )
                ],
              )),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Composição",
                    style: Styles.smallTitle,
                    textAlign: TextAlign.start,
                  ),
                  DataBar(
                    padding: EdgeInsets.only(top: 5),
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
                      data: ["Carboidratos", "Proteínas", "Gorduras", "Outros"],
                      colors: [
                        Color(0xFFFF4646),
                        Color(0xFFFF4646),
                        Color(0xFFFF4646),
                        Styles.lightMutedGrey,
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
