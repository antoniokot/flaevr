import 'dart:convert';
import 'package:flaevr/models/Score.dart';
import 'package:flaevr/utils/sharedAssets.dart';
import 'package:http/http.dart' as http;

//

class ScoresService {
  static Future<Score?> getScoresById(int id) async {
    try {
      final response = await http.get(
          Uri.parse(SharedAssets.apiURL + "/scores/product/" + id.toString()));

      if (response.statusCode == 200) {
        List<dynamic> values = json.decode(response.body);
        Map<String, dynamic> map = values[0];
        return Score.fromJson(map);
      } else {
        return null;
      }
    } catch (e) {
      print("\x1B[33mScoresService.dart: \x1B[0m" + e.toString());
      return null;
    }
  }
}
