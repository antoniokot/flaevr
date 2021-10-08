import 'package:flaevr/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class UserService {
  static Future<User> postNewUser(context, User u) async {
    try {
      final response = await http
          .post(Uri.parse('http://127.0.0.1:3333/users/post'), body: {
        "name": u.name,
        "email": u.email,
        "password": u.password,
      });

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print(response.body.toString());
        //List<dynamic> values = 
        

        Map<String, dynamic> map = json.decode(response.body);
        print(User.fromJson(map).name);

        return User.fromJson(map);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<User> login(context, String email, String password) async {
    try {
      final response = await http
          .post(Uri.parse('http://127.0.0.1:3333/users/login/'), body: {
              "email": email,
              "password": password,
          });

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        // print(response.body.toString());
        //List<dynamic> values = 
        

        Map<String, dynamic> map = json.decode(response.body);
        print(User.fromJson(map).name);

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
