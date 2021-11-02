import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flaevr/models/Favourite.dart';
import 'package:http/http.dart' as http;

class FavouriteService {
  Future<Favourite?> getFavouriteById(int id) async {
    try {
      Favourite? favourite;
      final response = await http
          .get(Uri.parse("http://127.0.0.1:3333/favourites" + id.toString()));

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
      print(e);
      return null;
    }
  }

  void postNewFavourite(context, int idUser) async {
    try {
      final response = await http
          .post(Uri.parse('http://127.0.0.1:3333/favourites/post'), body: {
        "idUser": idUser,
      });
    } catch (e) {
      print(e);
    }
  }
}
