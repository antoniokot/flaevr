import 'package:flaevr/components/curvedText.dart';
import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/pages/badgeDetails.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  @override
  Badge({required this.badge, required this.showLabel});

  final Stamp badge;
  final bool showLabel;
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
    return InkWell(
        onLongPress: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BadgeDetails(badge: this.badge))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 67,
                width: 67,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(34.0),
                  child: Image(
                    image: AssetImage(
                        "lib/assets/images/badges/" + this.badge.name + ".png"),
                    fit: BoxFit.contain,
                  ),
                )),
            this.showLabel
                ? Container(
                    width: 67,
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      this.badge.name,
                      style: Styles.smallText,
                      textAlign: TextAlign.center,
                    ))
                : Container()
          ],
        ));
  }
}
