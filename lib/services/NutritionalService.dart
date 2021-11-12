import 'package:flaevr/models/NutritionalFactsRow.dart';
import 'package:http/http.dart' as http;
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:flaevr/utils/sharedAssets.dart';
import 'dart:convert';

class NutriotinalService {
  //get entire nutritional facts table from product id
  static Future<NutritionalFacts?> getByID(int id) async {
    try {
      final response = await http.get(Uri.parse(
          SharedAssets.apiURL + '/nutritionalFacts/product/' + id.toString()));

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);

        final mainResp = await http.get(Uri.parse(SharedAssets.apiURL +
            '/nutrientsNutritionalFacts/product/' +
            id.toString()));
        var listJson;
        if (mainResp.statusCode == 200) {
          listJson = jsonDecode(mainResp.body);
        } else {
          return null;
        }
        if (listJson != null) {
          List<NutritionalFactsRow> nutrients = List<NutritionalFactsRow>.from(
              listJson.map((model) => NutritionalFactsRow.fromJson(model)));
          return new NutritionalFacts(
              id: json[0]['idNutritionalFacts'],
              idProduct: json[0]['idProduct'],
              serving: json[0]['serving'],
              nutrients: nutrients);
        } else
          return null;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
