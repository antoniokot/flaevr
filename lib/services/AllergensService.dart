import 'package:flaevr/models/Ingredient.dart';

class AllergenService {
  static List<String> getListOfAllergens(List<Ingredient> items) {
    List<String> ret = [];
    for (var item in items) {
      if (item.hasEgg == 1 && !items.contains("egg")) {
        ret.add("egg");
      }
      if (item.hasFish == 1 && !items.contains("fish")) {
        ret.add("fish");
      }
      if (item.hasGluten == 1 && !items.contains("gluten")) {
        ret.add("gluten");
      }
      if (item.hasMilk == 1 && !items.contains("milk")) {
        ret.add("milk");
      }
      if (item.hasNuts == 1 && !items.contains("nuts")) {
        ret.add("nuts");
      }
      if (item.hasSeafood == 1 && !items.contains("seafood")) {
        ret.add("seafood");
      }
      if (item.hasSoy == 1 && !items.contains("soy")) {
        ret.add("soy");
      }
      if (item.hasSugar == 1 && !items.contains("sugar")) {
        ret.add("sugar");
      }
    }
    return ret;
  }
}
