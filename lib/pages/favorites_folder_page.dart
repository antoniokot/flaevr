import 'package:flutter/material.dart';
import 'package:flaevr/components/folder_item.dart';

class FolderPage extends StatefulWidget {
  const FolderPage ({ Key key }) : super(key: key);

  @override
  FolderPage_State createState() => FolderPage_State();
}

class FolderPage_State extends State<FolderPage> {
  int listLenght = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(
                "Favoritos",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF3D3D4E)),
              ),
              Expanded(
                child: SizedBox(
                  height: 200.0,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: (MediaQuery.of(context).size.width / 2) - 5,
                      childAspectRatio: 1,
                    ), 
                    padding: EdgeInsets.only(top: 20),
                    itemCount: listLenght,
                    itemBuilder: (context, index){
                      return Container(
                        child: FolderCard(),
                        //height: 50,
                      );
                    } 
                  ),
                )
              )
            ],
          ),
        )
    );
  }
}