import 'package:flaevr/models/Ingredient.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:http/http.dart';
import 'dart:convert';

class IngredientService {
  //get entire nutritional facts table from product id
  static Future<List<Ingredient>> getByID(int id) async {
    try {
      

      // if (response.statusCode == 200) {
        
      // } else {
      //   // If the server did not return a 200 OK response,
      //   // then throw an exception.
      //   return null;
      // }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
