import 'package:flaevr/models/Ingredient.dart';

class AllergenService {
  static List<String> getListOfAllergens(List<Ingredient> items) {
    List<String> ret = [];
    print(items.toString());
    for (var item in items) {
      if (item.hasEgg == 1 && !ret.contains("egg")) {
        ret.add("egg");
      }
      if (item.hasFish == 1 && !ret.contains("fish")) {
        ret.add("fish");
      }
      if (item.hasGluten == 1 && !ret.contains("gluten")) {
        ret.add("gluten");
      }
      if (item.hasMilk == 1 && !ret.contains("milk")) {
        ret.add("milk");
      }
      if (item.hasNuts == 1 && !ret.contains("nuts")) {
        ret.add("nuts");
      }
      if (item.hasSeafood == 1 && !ret.contains("seafood")) {
        ret.add("seafood");
      }
      if (item.hasSoy == 1 && !ret.contains("soy")) {
        ret.add("soy");
      }
      if (item.hasSugar == 1 && !ret.contains("sugar")) {
        ret.add("sugar");
      }
    }
    print(ret.toString());
    return ret;
  }
}
