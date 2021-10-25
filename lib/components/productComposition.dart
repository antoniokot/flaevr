import 'package:flaevr/components/ingredients.dart';
import 'package:flaevr/components/nutritionalValues.dart';
import 'package:flaevr/components/slider.dart';
import 'package:flaevr/models/Ingredient.dart';
import 'package:flaevr/models/NutrientNutrionalFacts.dart';
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:flaevr/models/NutritionalFactsRow.dart';
import 'package:flutter/cupertino.dart';

class ProductComposition extends StatelessWidget {
  @override
  ProductComposition(
      {@required this.ingredients, @required this.nutritionalFacts});

  final NutritionalFacts nutritionalFacts;
  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: SliderCustom(
          children: [
            NutritionalValues(nutritionalFacts: this.nutritionalFacts),
            Ingredients(ingredients: this.ingredients)
          ],
          borderRadius: 20,
          overlap: false,
          activeColor: Color(0xFFFF4646),
          inactiveColor: Color(0XFFFF9D9D),
        ));
  }
}
