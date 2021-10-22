import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/pages/product.dart';
import 'package:flaevr/pages/products.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/pages/favorites_folder_page.dart';
import 'dart:math';

class FavFolder extends StatefulWidget {
  const FavFolder({Key key, this.folder}) : super(key: key);

  final Folder folder;

  @override
  FavFolderState createState() => FavFolderState();
}

class FavFolderState extends State<FavFolder> {
  int numberOfItems = 3;

  //temp
  var weightValues = [1, 2, 2, 3, 3, 3];
  FavFolderState() {
    numberOfItems = weightValues[Random().nextInt(6)];
  }

  //endtemp

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
        child: InkResponse(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: numberOfItems >= 2
                              ? const EdgeInsets.only(right: 3.0)
                              : EdgeInsets.all(0),
                          child: Container(
                              height: MediaQuery.of(context).size.width /
                                  3.189, // só aceita q eh esse numero
                              decoration: BoxDecoration(
                                color: Color(0xFFA9F6FC),
                                borderRadius: BorderRadius.only(
                                    topRight: numberOfItems < 2
                                        ? Radius.circular(18.0)
                                        : Radius.circular(0),
                                    topLeft: Radius.circular(18.0),
                                    bottomRight: numberOfItems < 2
                                        ? Radius.circular(18.0)
                                        : Radius.circular(0),
                                    bottomLeft: Radius.circular(18.0)),
                              ),
                              child: Padding(
                                padding: numberOfItems > 1
                                    ? const EdgeInsets.all(8.0)
                                    : EdgeInsets.only(
                                        left: 28, right: 28, bottom: 8, top: 8),
                                child: Image(
                                    image: AssetImage(
                                        "lib/assets/images/flaevr_logo_rounded.png")),
                              )),
                        )),
                    Expanded(
                      flex: numberOfItems < 2 ? 0 : 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              flex: numberOfItems >= 2 ? 1 : 0,
                              child: Padding(
                                padding: numberOfItems >= 3
                                    ? const EdgeInsets.only(bottom: 3.0)
                                    : EdgeInsets.all(0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffDE9DFC),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(18.0),
                                          topLeft: Radius.circular(0),
                                          bottomRight: numberOfItems < 3
                                              ? Radius.circular(18.0)
                                              : Radius.circular(0),
                                          bottomLeft: Radius.circular(0)),
                                    ),
                                    child: numberOfItems >= 2
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image(
                                                image: AssetImage(
                                                    "lib/assets/images/flaevr_logo_rounded.png")),
                                          )
                                        : null),
                              )),
                          Expanded(
                              flex: numberOfItems == 3 ? 1 : 0,
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff8A8FD7),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(18.0)),
                                  ),
                                  child: numberOfItems >= 3
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                              image: AssetImage(
                                                  "lib/assets/images/flaevr_logo_rounded.png")),
                                        )
                                      : null)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  widget.folder.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.5,
                      color: Color(0xFF3D3D4E)),
                ),
              ),
            ],
          ),
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FolderPage(folder: this.widget.folder)))
          },
        ),
      ),
    );
  }
}
