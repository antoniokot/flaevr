import 'package:flaevr/models/NutritionalFactsRow.dart';

import 'NutritionalFacts.dart';
import 'Ingredient.dart';

class Composition {
  NutritionalFacts? nutritionalFacts;
  List<Ingredient>? ingredients;

  Composition({
    this.nutritionalFacts,
    this.ingredients,
  });
}
