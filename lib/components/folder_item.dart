import 'package:flaevr/pages/product.dart';
import 'package:flutter/material.dart';

class FolderItemCard extends StatefulWidget {
  const FolderItemCard({Key? key}) : super(key: key);

  @override
  _FolderCardItemState createState() => _FolderCardItemState();
}

class _FolderCardItemState extends State<FolderItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  height: 140, // só aceita q eh esse numero
                  decoration: BoxDecoration(
                    //color: Color(0xFFFFFFFF),
                    color: Color(0xFFEEEFFF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18.0),
                        topLeft: Radius.circular(18.0),
                        bottomRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0)),
                  ),
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 28, right: 28, bottom: 8, top: 8),
                      child: Image(
                          image: AssetImage(
                              "lib/assets/images/flaevr_logo_rounded.png")),
                    ),
                  )),
              Container(
                height: 35,
                decoration: BoxDecoration(
                    color: Color(0xA8E0CE26),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    )),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            "Batata suprema incrivel woohooo vem quem vem pd terror",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFFFFFF)),
                          ),
                        ),
                        Icon(Icons.arrow_forward,
                            size: 20, color: Color(0xFFFFFFFF))
                      ]),
                ),
              ),
            ],
          ),
        ),
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Product()))
        },
      ),
    );
  }
}
