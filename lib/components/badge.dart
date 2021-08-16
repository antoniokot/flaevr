import 'package:flaevr/components/curvedText.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: CurvedText(
        text: "Vegano",
        radius: 25,
        startAngle: 0,
        textStyle: TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
