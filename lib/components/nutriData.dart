import 'package:flaevr/components/dataBar.dart';
import 'package:flaevr/components/dataBarSubtitle.dart';
import 'package:flaevr/models/Ingredient.dart';
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:flaevr/models/NutritionalFactsRow.dart';
import 'package:flaevr/models/NutritionalQuantity.dart';
import 'package:flaevr/utils/nutritionalCalculator.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flaevr/utils/warnings.dart';
import 'package:flutter/material.dart';

import 'ingredientTile.dart';

class NutriData extends StatelessWidget {
  NutriData({required this.ingredients, required this.nutritionalFacts});

  final NutritionalFacts nutritionalFacts;
  final List<Ingredient> ingredients;

  double lookForItemInNutrients(String key) {
    for (NutritionalFactsRow nutrient in nutritionalFacts.nutrients) {
      if (nutrient.nutrient.toUpperCase() == key.toUpperCase()) {
        return double.parse(
            nutrient.value.replaceAll(new RegExp(r'[^0-9\.\,]'), ''));
      }
    }
    return 0.0;
  }

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
      physics: BouncingScrollPhysics(),
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
                  data: () {
                    try {
                      return [lookForItemInNutrients("Valor energético")];
                    } catch (e) {
                      return [200.0];
                    }
                  }(),
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
                  double sugar = lookForItemInNutrients("Açúcares");
                  if (sugar > 5) {
                    ret.add(IngredientTile(
                      title: Warnings.sugar[0],
                      text: Warnings.sugar[2],
                      trailingColor: Colors.red,
                    ));
                  }
                  if (sugar < 5 && sugar > 0)
                    ret.add(IngredientTile(
                      title: "Baixo em açúcar",
                      text: Warnings.sugar[2],
                      trailingColor: Colors.green,
                    ));
                  if (sugar == 0)
                    ret.add(IngredientTile(
                      title: "Zero açúcar",
                      text: Warnings.sugar[2],
                      trailingColor: Colors.green,
                    ));

                  double sodium = lookForItemInNutrients("Sódio");
                  if (sodium > 200)
                    ret.add(IngredientTile(
                      title: Warnings.sodium[0],
                      text: Warnings.sodium[2],
                      trailingColor: Colors.red,
                    ));
                  if (sodium < 200 && sodium > 0)
                    ret.add(IngredientTile(
                      title: "Baixo em sódio",
                      text: Warnings.sodium[2],
                      trailingColor: Colors.green,
                    ));
                  if (sodium == 0)
                    ret.add(IngredientTile(
                      title: "Zero sódio",
                      text: Warnings.sodium[2],
                      trailingColor: Colors.green,
                    ));

                  // ret.add(IngredientTile(
                  //   title: Warnings.add[0],
                  //   text: Warnings.add[2],
                  //   imageTrailing: AssetImage(Warnings.add[1]),
                  //   trailingColor: Colors.red,
                  // ));
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
                          lookForItemInNutrients("Valor energético")
                                  .toString() +
                              " kCal",
                          style: Styles.smallText,
                        ),
                      ]),
                  DataBar(
                    padding: EdgeInsets.only(top: 10),
                    max: 388,
                    isDataInPercentage: false,
                    data: NutritionalCalculator.caloriesPercentage(
                            388,
                            lookForItemInNutrients("Carboidratos"),
                            lookForItemInNutrients("Gorduras Totais"),
                            lookForItemInNutrients("Proteínas"))
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
              padding: Styles.sidePadding.add(EdgeInsets.only(top: 25)),
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
                    max: this.nutritionalFacts.serving.isNotEmpty
                        ? double.parse(
                            this.nutritionalFacts.serving.replaceAll("g", ''))
                        : 100,
                    isDataInPercentage: true,
                    data: NutritionalCalculator.gramsCompositionPercentage(
                        double.parse(
                            this.nutritionalFacts.serving.replaceAll("g", '')),
                        new NutritionalQuantities(
                            carbs: lookForItemInNutrients("Carboidratos"),
                            fats: lookForItemInNutrients("Gorduras totais"),
                            proteins: lookForItemInNutrients("Prteínas"),
                            other: 0)),
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
