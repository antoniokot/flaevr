import 'package:flutter/material.dart';

class FavFolder extends StatefulWidget {
  const FavFolder({ Key key }) : super(key: key);

  @override
  FavFolderState createState() => FavFolderState();
}

class FavFolderState extends State<FavFolder> {
  int numberOfItems = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.lightBlueAccent,
                      child: Image(image: AssetImage("lib/assets/images/flaevr_logo_rounded.png"))
                    )
                  ),
                  Expanded(
                    flex: numberOfItems < 2 ? 0 : 1,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: numberOfItems >= 2 ? 1 : 0,
                          child: Container(
                            color: Colors.lightBlueAccent,
                            child: numberOfItems >= 2 ? Image(image: AssetImage("lib/assets/images/flaevr_logo_rounded.png")) : null
                          )
                        ),
                        Expanded(
                          flex: numberOfItems == 3 ? 1 : 0,
                          child: Container(
                            color: Colors.lightBlueAccent,
                            child: numberOfItems >= 3 ? Image(image: AssetImage("lib/assets/images/flaevr_logo_rounded.png")) : null
                          )
                        ),
                      ],   
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(            
            child: Text(
              "Produto Bacana",
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}