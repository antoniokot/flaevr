import 'package:flaevr/models/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:flaevr/models/EnvironmentData.dart';
import 'package:http/http.dart';
import 'dart:convert';

class EnvironmentDataService {
  //get all environment data by id;
  static Future<List<EnvironmentData>> getByID(int id) async {
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
