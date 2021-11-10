import 'package:flaevr/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  IngredientTile(
      {required this.title, required this.text, required this.imageTrailing});

  final String title;
  final String text;
  final ImageProvider imageTrailing;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 14),
        child: Card(
            elevation: 0,
            borderOnForeground: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Styles.ultraLightMutedGrey,
            child: Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: this.imageTrailing,
                    ),
                  ),
                ),
                title: Text(
                  title,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      text,
                      style: Styles.smallText,
                    ),
                  )
                ],
              ),
            )));
  }
}
