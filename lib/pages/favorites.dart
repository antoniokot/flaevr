import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/components/folder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Favorites extends StatefulWidget {
  const Favorites({Key key, this.built}) : super(key: key);

  final bool built;
  
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int id = 1;
  Future<List<Folder>> folders;

  void initState() {
    super.initState();
    folders = fetchAllById(id);
  }

  Future<List<Folder>> fetchAllById(id) async {
    final response = await http.get(Uri.parse('/users/unique/$id'));

    if (response.statusCode == 200) {
      List<Folder> folders;
      // verificar depois se jsonDecode(response.body) nn precisa de [indexacao]
      folders = jsonDecode(response.body)
          .map((data) => Folder.fromJson(data))
          .toList();

      return folders;
    } else {
      throw Exception('Failed to load favorite folders');
    }
  }

  int listLenght = 5;
  @override
  Widget build(BuildContext context) {
    // TextStyle dangerText = TextStyle(
    //     fontWeight: FontWeight.w500,
    //     fontSize: 14,
    //     color: Color(0xFFFF4646)
    // );
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xFF3d3d4e)),
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Favoritos",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF3D3D4E)),
                  ),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Styles.lightMutedGrey,
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Nova Pasta",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () => {},
                  )
                ],
              ),
              Expanded(
                  child: SizedBox(
                height: 250.0,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 19,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    padding: EdgeInsets.only(top: 20),
                    itemCount: listLenght,
                    itemBuilder: (context, index) {
                      if (widget.built == true) {
                        return Container(
                          child: FavFolder(),
                          //height: 50,
                        );
                      } else
                        return Skeleton(radius: 18);
                    }),
              ))
            ],
          ),
        ));
  }
}
