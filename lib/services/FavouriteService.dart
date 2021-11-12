import 'dart:convert';
import 'package:flaevr/utils/sharedAssets.dart';
import 'package:flaevr/models/Favourite.dart';
import 'package:http/http.dart' as http;

class FavouriteService {
  Future<Favourite?> getFavouriteById(int id) async {
    try {
      Favourite? favourite;
      final response = await http
          .get(Uri.parse(SharedAssets.apiURL + "/favourites" + id.toString()));

      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);

        decodeJson.forEach((item) => {
              favourite = new Favourite(
                id: item['idFavourite'],
                idProduct: item['idProduct'],
              )
            });

        return favourite;
      } else {
        return null;
      }
    } catch (e) {
      print("\x1B[33mFavouriteService.dart: x1B[0m" + e.toString());
      return null;
    }
  }

  void postNewFavourite(context, int idUser) async {
    try {
      final response = await http
          .post(Uri.parse(SharedAssets.apiURL + '/favourites/post'), body: {
        "idUser": idUser,
      });
    } catch (e) {
      print("\x1B[33mFavouriteService.dart: x1B[0m" + e.toString());
    }
  }
}
