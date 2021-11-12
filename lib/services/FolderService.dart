import 'dart:convert';
import 'package:flaevr/models/Folder.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flaevr/utils/sharedAssets.dart';

class FolderService {
  static Future<List<Folder>?> getAllFoldersByIdUser(int idUser) async {
    try {
      List<Folder> folders = [];
      final response = await http.get(
          Uri.parse(SharedAssets.apiURL + '/folders/' + idUser.toString()));

      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);

        decodeJson.forEach((item) => {
              folders.add(new Folder(
                id: item['idFolder'],
                name: item['name'],
                idUser: item['idUser'],
              ))
            });

        return folders;
      } else {
        return [];
      }
    } catch (e) {
      print("\x1B[33mFolderService.dart: x1B[0m" + e.toString());
      return null;
    }
  }

  static Future<Folder?> getFolderById(int id) async {
    try {
      Folder? folder;
      final response = await http.get(
          Uri.parse(SharedAssets.apiURL + '/folders/unique/' + id.toString()));

      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);

        decodeJson.forEach((item) => {
              folder = new Folder(
                id: item['idFolder'],
                name: item['name'],
                idUser: item['idUser'],
              )
            });

        return folder;
      } else {
        return null;
      }
    } catch (e) {
      print("\x1B[33mFolderService.dart: x1B[0m" + e.toString());
      return null;
    }
  }

  static Future<Response?> postNewFolder(String name, int idUser) async {
    try {
      final response = await http
          .post(Uri.parse(SharedAssets.apiURL + '/folders/post'), body: {
        "name": name.toString(),
        "idUser": idUser.toString(),
      });
      return response;
    } catch (e) {
      print("\x1B[33mFolderService.dart: x1B[0m" + e.toString());
    }
  }
}
