import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/services/FolderService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/components/folder.dart';
import 'package:flutter_session/flutter_session.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key key, this.built, this.folders}) : super(key: key);

  final bool built;
  final List<Folder> folders;

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  void initState() {
    super.initState();
  }

  // Future<List<Folder>> fetchAllById(id) async {
  //   final response = await http.get(Uri.parse('/users/unique/$id'));

  //   if (response.statusCode == 200) {
  //     List<Folder> folders;
  //     // verificar depois se jsonDecode(response.body) nn precisa de [indexacao]
  //     folders = jsonDecode(response.body)
  //         .map((data) => Folder.fromJson(data))
  //         .toList();

  //     return folders;
  //   } else {
  //     throw Exception('Failed to load favorite folders');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // TextStyle dangerText = TextStyle(
    //     fontWeight: FontWeight.w500,
    //     fontSize: 14,
    //     color: Color(0xFFFF4646)
    // );
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 19,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        padding: EdgeInsets.only(top: 20),
        itemCount: widget.folders.length,
        itemBuilder: (context, index) {
          if (widget.built == true) {
            return Container(
              child: () {
                if (widget.built != true)
                  return Skeleton();
                else
                  return FavFolder(folder: widget.folders[index]);
              }(),
              //height: 50,
            );
          } else
            return Skeleton(radius: 18);
        });
  }
}
