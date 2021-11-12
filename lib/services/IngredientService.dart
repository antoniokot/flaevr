import 'package:flaevr/models/Ingredient.dart';
import 'package:http/http.dart' as http;
import 'package:flaevr/utils/sharedAssets.dart';
import 'dart:convert';

class IngredientService {
  //get entire nutritional facts table from product id
  static Future<List<Ingredient>?> getByID(int id) async {
    try {
      List<Ingredient> ingredients = [];
      final response = await http.get(Uri.parse(
          SharedAssets.apiURL + '/ingredients/product/' + id.toString()));

      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((json) => {
              ingredients.add(new Ingredient(
                  id: json['idIngredient'],
                  name: json['name'],
                  isVegan: json['isVegan'],
                  hasMilk: json['hasMilk'],
                  hasEgg: json['hasEgg'],
                  hasGluten: json['hasGluten'],
                  hasSeafood: json['hasSeafood'],
                  hasFish: json['hasFish'],
                  hasSugar: json['hasSugar'],
                  hasSoy: json['hasSoy'],
                  hasNuts: json['hasNuts']))
            });

        return ingredients;
      } else {
        return [];
      }
    } catch (e) {
      print("\x1B[33mIngredientService.dart: x1B[0m" + e.toString());
      return null;
    }
  }
}
