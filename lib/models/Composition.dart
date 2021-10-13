import 'package:flaevr/models/NutritionalFactsRow.dart';

import 'NutrientNutrionalFacts.dart';
import 'Ingredient.dart';

class Composition {
  List<NutritionalFactsRow> nutritionalFacts;
  List<Ingredient> ingredients;

  Composition({
    this.nutritionalFacts,
    this.ingredients,
  });
}
