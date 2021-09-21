import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  NotFound({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (19 + MediaQuery.of(context).size.width / 4),
                vertical: 10),
            child: Image(image: AssetImage("lib/assets/images/not_found.png"))),
        Text(
          text,
          style: TextStyle(
              color: Color(0xFF3d3d4e),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        )
      ]),
    );
  }
}
