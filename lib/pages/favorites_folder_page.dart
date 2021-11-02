import 'package:flaevr/components/folder.dart';
import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/pages/products.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flaevr/components/folder_item.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({Key? key, required this.folder}) : super(key: key);

  final Folder folder;

  @override
  FolderPage_State createState() => FolderPage_State();
}

class FolderPage_State extends State<FolderPage> {
  int listLenght = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xFF3d3d4e)),
          elevation: 0.0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  this.widget.folder.name, //nome da pasta
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF3D3D4E)),
                ),
              ),
              Expanded(
                  child: Products(
                folder: this.widget.folder,
              ))

              // Expanded(
              //   child: SizedBox(
              //     height: 200.0,
              //     child: GridView.builder(
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         crossAxisSpacing: 19.0,
              //         mainAxisExtent: 200,
              //         childAspectRatio: 3/2.25,
              //       ),
              //       padding: EdgeInsets.all(0),
              //       itemCount: listLenght,
              //       itemBuilder: (context, index){
              //         return Container(
              //           child: FolderItemCard(),
              //           //height: 50,
              //         );
              //       }
              //     ),
              //   )
              // )
            ],
          ),
        ));
  }
}
