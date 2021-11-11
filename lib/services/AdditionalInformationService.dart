import 'dart:convert';
import 'package:flaevr/utils/sharedAssets.dart';
import 'package:flaevr/models/AdditionalInformation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AdditionalInformationService {
  Future<AdditionalInformation?> getAdditionalInformation(int id) async {
    try {
      AdditionalInformation? aInformation;

      final response = await http.get(Uri.parse(
          SharedAssets.apiURL + "/additionalInformations/" + id.toString()));

      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);

        decodeJson.forEach((item) => {
              aInformation = new AdditionalInformation(
                id: item['idAdditionalInformation'],
                idUser: item['idUser'],
                age: item['age'],
                gender: item['gender'],
                af: item['af'],
                height: item['height'],
                weight: item['weight'],
                idealWeight: item['idealWeight'],
              )
            });

        return aInformation;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Response> postNewAdditionalInformation(
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
            "idUser": idUser,
            "age": age,
            "gender": gender,
            "af": af,
            "height": height,
            "weight": weight,
            "idealWeight": idealWeight,
          });
      return response;
    } catch (e) {
      print(e);
    }
    return new http.Response("error", 500);
  }
}
