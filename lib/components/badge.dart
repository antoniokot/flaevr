import 'package:flaevr/components/curvedText.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 75,
              width: 75,
              child: Center(
                child: Icon(
                  Icons.change_history,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Center(
              child: CurvedText(
                text: "Vegano    -    Vegano",
                radius: 27,
                startAngle: 0,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ));
  }
}
