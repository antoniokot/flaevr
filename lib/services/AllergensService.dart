import 'package:flaevr/models/Ingredient.dart';

class AllergenService {
  static List<String> getListOfAllergens(List<Ingredient> items) {
    List<String> ret = [];
    print(items.toString());
    for (var item in items) {
      if (item.hasEgg == 1 && !ret.contains("egg")) {
        ret.add("Ovo");
      }
      if (item.hasFish == 1 && !ret.contains("fish")) {
        ret.add("Peixe");
      }
      if (item.hasGluten == 1 && !ret.contains("gluten")) {
        ret.add("Glútem");
      }
      if (item.hasMilk == 1 && !ret.contains("milk")) {
        ret.add("Leite");
      }
      if (item.hasNuts == 1 && !ret.contains("nuts")) {
        ret.add("Nozes");
      }
      if (item.hasSeafood == 1 && !ret.contains("seafood")) {
        ret.add("Frutos do Mar");
      }
      if (item.hasSoy == 1 && !ret.contains("soy")) {
        ret.add("Soja");
      }
      if (item.hasSugar == 1 && !ret.contains("sugar")) {
        ret.add("Açúcar");
      }
    }
    print(ret.toString());
    return ret;
  }
}
