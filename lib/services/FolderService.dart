import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flaevr/models/Folder.dart';
import 'package:http/http.dart' as http;

class FolderService {

   Future<List<Folder>> getAllFoldersByIdUser(int idUser) async{
    try {
      List<Folder> folders = [];
      final response = await http.get(Uri.parse('http://127.0.0.1:3333/folders/' + idUser.toString()));

      if(response.statusCode == 200) {
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
    }
    catch (e) {
      print(e);
      return null;
    }
  }

  Future<Folder> getFolderById(int id) async{
     try {
        Folder folder;
        final response = await http.get(Uri.parse('http://127.0.0.1:3333/folders/unique/' + id.toString()));

        if(response.statusCode == 200) {
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
     }
     catch (e) {
       print(e);
       return null;
     }
  }

  void postNewFolder(context, String name, int idUser) async {
    try {
        final response = await http.post(Uri.parse('http://127.0.0.1:3333/folders/post'), body: {
          "name": name,
          "idUSer": idUser,
        });
    }
    catch (e) {
      print(e);
    }
  }
}