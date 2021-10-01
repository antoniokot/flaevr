import 'package:flaevr/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class UserService {
  static Future<Response> postNewFavourite(context, User u) async {
    try {
      final response = await http
          .post(Uri.parse('http://127.0.0.1:3333/favourites/post'), body: {
        "name": u.name,
        "email": u.email,
        "password": u.password,
      });
      return response;
    } catch (e) {
      print(e);
    }
  }

  static Future<User> getByID(int id) async {
    try {
      final response = await http
          .get(Uri.parse('http://127.0.0.1:3333/users/unique/' + id.toString()));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print(response.body.toString());
        List<dynamic> values = json.decode(response.body);
        Map<String, dynamic> map = values[0];
        return User.fromJson(map);
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
