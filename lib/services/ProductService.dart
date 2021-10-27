import 'package:flaevr/models/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class ProductService {
  static Future<ProductModel> getByID(int id) async {
    try {
      final response = await http
          .get(Uri.parse('http://127.0.0.1:3333/products/' + id.toString()));

      if (response.statusCode == 200) {
        List<dynamic> values = json.decode(response.body);
        Map<String, dynamic> map = values[0];
        return ProductModel.fromJson(map);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  //TERMINAR
  static Future<ProductModel> getByBarcode(String code) async {
    try {
      final response = await http.get(
          Uri.parse('http://127.0.0.1:3333/products/unique/barcode/' + code));

      if (response.statusCode == 200) {
        List<dynamic> values = json.decode(response.body);
        Map<String, dynamic> map = values[0];
        return ProductModel.fromJson(map);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<ProductModel>> getAllProductsInFolder(int id) async {
    try {
      final response = await http.get(
          Uri.parse('http://127.0.0.1:3333/products/folder/' + id.toString()));

      if (response.statusCode == 200) {
        List<ProductModel> ret = [];
        var decodeJson = jsonDecode(response.body);

        decodeJson.forEach((item) => {
              ret.add(new ProductModel(
                  id: item['idProduct'],
                  name: item['name'],
                  barcode: item['barcode'],
                  pictureUrl: item['pictureUrl']))
            });
        return ret;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<ProductModel>> getAllRecentProducts(int idUser) async {
    try {
      final response = await http.get(Uri.parse(
          'http://127.0.0.1:3333/products/user/' + idUser.toString()));

      if (response.statusCode == 200) {
        List<ProductModel> ret = [];
        var decodeJson = jsonDecode(response.body);

        for (var item in decodeJson) {
          ret.add(ProductModel.fromJson(item));
        }
        return ret;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
