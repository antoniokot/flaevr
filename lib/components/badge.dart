import 'package:flaevr/components/curvedText.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  List<Widget> getCustomCurvedText(String txt) {
    double textSize = txt.length * 20.0;
    int iteration = (360 / (textSize + 5)).round();
    String retText = "";
    double remainingSpace = 360 - ((textSize / 1.9) * iteration);
    for (int i = 0; i < iteration; i++) {
      retText =
          retText + (iteration == 2 ? calcSpaces(remainingSpace) : "   ") + txt;
    }
    List<Widget> ret = [];
    ret.add(CurvedText(
      text: retText,
      radius: 27,
      startAngle: 0,
      textStyle: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: remainingSpace / (remainingSpace * 2.8)),
    ));
    return ret;
  }

  String calcSpaces(double space) {
    String ret = "";
    double spacer = 22;
    if (space <= 140)
      spacer = 40;
    else if (space > 140 && space < 170) spacer = 40;
    for (int i = 0; i < (space / spacer).round(); i++) ret += " ";
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    /*return Container(
        height: 85,
        width: 85,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              height: 85,
              width: 85,
              child: Center(
                child: Icon(
                  Icons.local_drink,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            Center(
              child: Stack(children: getCustomCurvedText("Orgânicoooo")),
            )
          ],
        ));*/
    return Container(
        height: 85,
        width: 85,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Image(
          image: NetworkImage(
              "https://i.pinimg.com/originals/a9/d9/52/a9d952b64210ae40937fd430695cfffd.png"),
          fit: BoxFit.contain,
        ));
  }
}
