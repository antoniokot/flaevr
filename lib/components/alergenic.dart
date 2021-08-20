import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class Alergenic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xFFD5242A).withOpacity(0.8), // verde: 3DE639
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Icon(
              Icons.nature,
              color: Color(0xFFD5242A).withOpacity(1),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                width: MediaQuery.of(context).size.width - 98,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Nozes:", style: Styles.smallTitle),
                    SizedBox(
                      height: 5,
                    ),
                    Flexible(
                        child: Text(
                      "Este produto tem altas concentrações de amendoim em sua composição.",
                      style: Styles.smallText,
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
