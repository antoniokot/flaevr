import 'package:flaevr/models/Ingredient.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  @override
  Ingredients({required this.ingredients});

  final List<Ingredient> ingredients;

  List<Widget> generateTable() {
    List<Widget> ret = [
      Container(
          padding: EdgeInsets.only(bottom: 15, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ingredientes", style: Styles.mediumTitle),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      child: Text("Alergênico", style: Styles.mediumTitle)),
                  Container(
                      alignment: Alignment.center,
                      child: Text("Origem Animal", style: Styles.mediumTitle)),
                ],
              )
            ],
          ))
    ];
    for (int i = 0; i < ingredients.length; i++) {
      ret.add(Container(
          decoration: BoxDecoration(
              border: new Border(
            bottom: BorderSide(width: 1.0, color: Styles.ultraLightMutedGrey),
          )),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ingredients[i].name.length < 21
                    ? ingredients[i].name
                    : ingredients[i].name.substring(0, 21) + "...",
                style: Styles.smallText,
              ),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 70,
                      alignment: Alignment.center,
                      child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: ingredients[i].isAllergen == 1
                                ? Styles.textBlack
                                : Styles.lightMutedGrey,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ))),
                  Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: ingredients[i].isVegan == 1
                                ? Styles.lightMutedGrey
                                : Styles.textBlack,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ))),
                ],
              )
            ],
          )));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: Styles.sidePaddingWithVerticalSpace,
        width: (MediaQuery.of(context).size.width * 0.92) - 38,
        child: ListView(
          shrinkWrap: true,
          children: generateTable(),
        ));
  }
}
