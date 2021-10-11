import 'Ingredient.dart';
import 'NutritionalFacts.dart';

class Composition{
  List<NutritionalFacts> nutritionalFacts;
  List<Ingredient> ingredients;

  Composition({
    this.nutritionalFacts,
    this.ingredients,
  });
}