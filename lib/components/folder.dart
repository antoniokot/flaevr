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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Padding(
                          padding: numberOfItems >= 2 ? const EdgeInsets.only(right: 3.0) : EdgeInsets.all(0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.only(
                                topRight: numberOfItems < 2 ? Radius.circular(18.0) : Radius.circular(0), 
                                topLeft: Radius.circular(18.0), 
                                bottomRight: numberOfItems < 2 ? Radius.circular(18.0) : Radius.circular(0), 
                                bottomLeft: Radius.circular(18.0)
                              ),
                            ),
                            child: Padding(
                              padding: numberOfItems > 1 ? const EdgeInsets.all(8.0) : EdgeInsets.only(left: 28, right: 28, bottom: 8, top: 8),
                              child: Image(image: AssetImage("lib/assets/images/flaevr_logo_rounded.png")),
                            )
                          ),
                        )
                      ),
                      Expanded(
                        flex: numberOfItems < 2 ? 0 : 1,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: numberOfItems >= 2 ? 1 : 0,
                              child: Padding(
                                padding: numberOfItems >= 3 ? const EdgeInsets.only(bottom: 3.0) : EdgeInsets.all(0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(18.0), 
                                      topLeft: Radius.circular(0), 
                                      bottomRight: numberOfItems < 3 ? Radius.circular(18.0) : Radius.circular(0), 
                                      bottomLeft: Radius.circular(0)
                                    ),
                                  ),
                                  child: numberOfItems >= 2 ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(image: AssetImage("lib/assets/images/flaevr_logo_rounded.png")),
                                  ) : null
                                ),
                              )
                            ),
                            Expanded(
                              flex: numberOfItems == 3 ? 1 : 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,  
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(18.0)),
                                ),
                                child: numberOfItems >= 3 ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(image: AssetImage("lib/assets/images/flaevr_logo_rounded.png")),
                                ) : null
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
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.5,
                    color: Color(0xFF3D3D4E)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}