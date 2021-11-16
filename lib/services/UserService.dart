import 'package:flaevr/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:flaevr/utils/sharedAssets.dart';
import 'dart:convert';

class UserService {
  static Future<User?> postNewUser(context, User u) async {
    try {
      final response = await http
          .post(Uri.parse(SharedAssets.apiURL + '/users/post'), body: {
        "name": u.name,
        "email": u.email,
        "password": u.password,
      });

      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body)[0];

        return User.fromJson(map);
      } else
        return null;
    } catch (e) {
      print("\x1B[33mUserService.dart: x1B[0m" + e.toString());
    }
  }

  static Future<User?> login(String email, String password) async {
    try {
      final response = await http
          .post(Uri.parse(SharedAssets.apiURL + '/users/login/'), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);

        return User.fromJson(map);
      } else
        return null;
    } catch (e) {
      throw (e);
    }
  }

  static Future<User?> getByID(int id) async {
    try {
      final response = await http.get(
          Uri.parse(SharedAssets.apiURL + '/users/unique/' + id.toString()));

      if (response.statusCode == 200) {
        List<dynamic> values = json.decode(response.body);
        Map<String, dynamic> map = values[0];
        return User.fromJson(map);
      } else
        return null;
    } catch (e) {
      print("\x1B[33mUserService.dart: x1B[0m" + e.toString());
      return null;
    }
  }

  static Future<User?> putProfilePic(int id, String url) async {
    try {
      final response = await http.put(
          Uri.parse(SharedAssets.apiURL + '/users/avatar/' + id.toString()),
          body: {"avatar": url});

      if (response.statusCode == 200) {
        List<dynamic> values = json.decode(response.body);
        Map<String, dynamic> map = values[0];
        return User.fromJson(map);
      } else
        return null;
    } catch (e) {
      print("\x1B[33mUserService.dart: x1B[0m" + e.toString());
      return null;
    }
  }
}
