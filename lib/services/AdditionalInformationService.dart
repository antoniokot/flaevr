import 'dart:convert';
import 'package:flaevr/utils/sharedAssets.dart';
import 'package:flaevr/models/AdditionalInformation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AdditionalInformationService {
  static Future<AdditionalInformation?> getAdditionalInformation(int id) async {
    try {
      AdditionalInformation? aInformation;

      final response = await http.get(Uri.parse(SharedAssets.apiURL +
          "/additionalInformations/user/" +
          id.toString()));

      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);

        decodeJson.forEach((item) => {
              aInformation = new AdditionalInformation(
                idUser: item['idUser'],
                age: item['age'],
                gender: item['gender'].toString(),
                af: item['af'],
                height: item['height'] + 0.0,
                weight: item['weight'] + 0.0,
                idealWeight: item['idealWeight'] + 0.0,
              )
            });

        return aInformation;
      } else {
        return null;
      }
    } catch (e) {
      print("\x1B[33mAdditionalInformationService.dart: x1B[0m" + e.toString());
      return null;
    }
  }

  static Future<Response> postNewAdditionalInformation(
      context,
      int idUser,
      int age,
      String gender,
      int af,
      double height,
      double weight,
      double idealWeight) async {
    try {
      final response = await http.post(
          Uri.parse(SharedAssets.apiURL + '/additionalInformations/post'),
          body: {
            "idUser": idUser.toString(),
            "age": age.toString(),
            "gender": gender,
            "af": af.toString(),
            "height": height.toString(),
            "weight": weight.toString(),
            "idealWeight": idealWeight.toString(),
          });
      return response;
    } catch (e) {
      print("\x1B[33mAdditionalInformationService.dart: x1B[0m" + e.toString());
    }
    return new http.Response("error", 500);
  }
}
