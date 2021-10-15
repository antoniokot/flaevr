import 'package:flaevr/models/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/models/ProductStamp.dart';
import 'package:http/http.dart';
import 'dart:convert';

class StampService {
  //get all stamp
  static Future<List<Stamp>> getAllStamps() async {
    try {
      List<Stamp> stamps = [];
      final response = await http.get(Uri.parse('http://127.0.0.1:3333/stamps'));      
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);

        decodeJson.forEach((item) => {
              stamps.add(new Stamp(
                id: item['idStamp'],
                name: item['name'],
              ))
            });

        return stamps;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<Stamp>> getAllStampsByProductID(int id) async {
    // try {
    //   List<Stamp> stamps = [];
    //   final response = await http.get(Uri.parse('http://127.0.0.1:3333/productStamps/' + id.toString()));
    //   if (response.statusCode == 200) {
    //     var decodeJson = jsonDecode(response.body);

    //     decodeJson.forEach((item) => {
    //           stamps.add(new Stamp(
    //             id: item['idStamp'],
    //             name: item['name'],
    //           ))
    //         });

    //     return stamps;
    //   } else return null;
    // } catch(e) {
    //   print(e);
    //   return null;
    // }
    return null;
  }
}
