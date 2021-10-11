import 'package:flaevr/models/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class ProductService {
  static Future<ProductModel> getByID(int id) async {
    try {
      final response = await http
          .get(Uri.parse('http://127.0.0.1:3333/products/unique/' + id.toString()));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print(response.body.toString());
        List<dynamic> values = json.decode(response.body);
        Map<String, dynamic> map = values[0];
        return ProductModel.fromJson(map);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    }
    catch (e) {
       print(e);
       return null;
    }
  }

  //TERMINAR
  static Future<ProductModel> getByBarcode(String code) async {
    try {
      final response = await http
          .get(Uri.parse('http://127.0.0.1:3333/products/unique/barcode/' + code));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print(response.body.toString());
        List<dynamic> values = json.decode(response.body);
        Map<String, dynamic> map = values[0];
        return ProductModel.fromJson(map);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    }
    catch (e) {
       print(e);
       return null;
    }
  }
}