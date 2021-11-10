import 'package:flaevr/components/dataBar.dart';
import 'package:flaevr/components/dataBarSubtitle.dart';
import 'package:flaevr/models/NutritionalQuantity.dart';
import 'package:flaevr/utils/nutritionalCalculator.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flaevr/utils/warnings.dart';
import 'package:flutter/material.dart';

import 'ingredientTile.dart';

class NutriData extends StatelessWidget {
  NutriData();

  @override
  Widget build(BuildContext context) {
    double maxCalories = NutritionalCalculator.EER(20, 65, 1.72, 2, 'M');
    double size = MediaQuery.of(context).size.width;
    const List<Color> colorsList = [
      Color(0xFF3BCCC5),
      Color(0xFFFFF634),
      Color(0xFFff3858),
      Color(0xffE1E1E2),
    ];
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
                  padding: EdgeInsets.only(top: 10),
                  max: maxCalories,
                  data: [200],
                  width: size - 38,
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: () {
                  List<Widget> ret = [];

                  ret.add(IngredientTile(
                    title: Warnings.sugar[0],
                    text: Warnings.sugar[2],
                    imageTrailing: AssetImage(Warnings.sugar[1]),
                  ));

                  ret.add(IngredientTile(
                    title: Warnings.sodium[0],
                    text: Warnings.sodium[2],
                    imageTrailing: AssetImage(Warnings.sodium[1]),
                  ));

                  ret.add(IngredientTile(
                    title: Warnings.add[0],
                    text: Warnings.add[2],
                    imageTrailing: AssetImage(Warnings.add[1]),
                  ));
                  return ret;
                }(),
              )),
          Padding(
              padding: Styles.sidePadding.add(EdgeInsets.only(top: 25)),
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
                          style: Styles.smallText,
                        ),
                      ]),
                  DataBar(
                    padding: EdgeInsets.only(top: 10),
                    max: 388,
                    isDataInPercentage: false,
                    data: NutritionalCalculator.caloriesPercentage(
                            388, 53.0, 16.0, 7.9)
                        .toDoubleList(),
                    width: size - 38,
                    colors: colorsList,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: DataBarSubtitle(
                      data: ["Carboidratos", "Gorduras", "Proteínas"],
                      colors: colorsList,
                    ),
                  )
                ],
              )),
          Padding(
              padding: EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Composição",
                    style: Styles.smallTitle,
                    textAlign: TextAlign.start,
                  ),
                  DataBar(
                    colors: colorsList,
                    padding: EdgeInsets.only(top: 10),
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
                        data: ["Carboidratos", "Gorduras", "Proteínas"],
                        colors: colorsList),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
