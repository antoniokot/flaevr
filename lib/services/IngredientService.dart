import 'package:flaevr/models/Ingredient.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:http/http.dart';
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
        print(decodeJson.toString());
        decodeJson.forEach((json) => {
              ingredients.add(new Ingredient(
                  id: json['idStamp'],
                  name: json['name'],
                  isAllergen: json['isAllergen'],
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
      print(e);
      return null;
    }
  }
}
