import 'package:flaevr/models/NutritionalFactsRow.dart';

import 'NutritionalFacts.dart';
import 'Ingredient.dart';

class Composition {
  NutritionalFacts nutritionalFacts;
  List<Ingredient> ingredients;

  Composition({
    required this.nutritionalFacts,
    required this.ingredients,
  });
}
