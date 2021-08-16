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
                color: Color(0xFFE6353B), // verde: 3DE639
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Icon(
              Icons.nature,
              color: Colors.green.shade700,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nozes:", style: Styles.smallTitle),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Este produto tem altas concentrações de amendoim em sua composição.")
                ],
              ))
        ],
      ),
    );
  }
}
