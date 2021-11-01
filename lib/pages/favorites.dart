import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/services/FolderService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/components/folder.dart';
import 'package:flutter_session/flutter_session.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key key, this.built, this.folders, this.onClick})
      : super(key: key);

  final bool built;
  final List<Folder> folders;
  final Function onClick;

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  void initState() {
    super.initState();
  }

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
        itemCount: widget.built == true ? widget.folders.length : 6,
        itemBuilder: (context, index) {
          if (widget.built == true) {
            return Container(
              child: () {
                if (widget.built != true)
                  return Skeleton();
                else
                  return FavFolder(
                      folder: widget.folders[index],
                      onClick: this.widget.onClick);
              }(),
              //height: 50,
            );
          } else
            return Skeleton(radius: 18);
        });
  }
}
