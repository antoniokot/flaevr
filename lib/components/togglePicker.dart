import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class TogglePicker extends StatefulWidget {
  TogglePicker({Key? key}) : super(key: key);

  @override
  TogglePickerState createState() => TogglePickerState();
}

class TogglePickerState extends State<TogglePicker> {
  double xAlign = -1;
  Color mColor = Colors.white;
  Color fColor = Color(0xff3d3d4e);
  Color oColor = Color(0xff3d3d4e);
  @override
  Widget build(BuildContext context) {
    const double mAlign = -1;
    const double fAlign = 0;
    const double oAlign = 1;
    const Color selectedColor = Colors.white;
    const Color normalColor = Color(0xff3d3d4e);
    const double width = 200;
    const double height = 40;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Styles.ultraLightMutedGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: Duration(milliseconds: 300),
            child: Container(
              width: width * (1 / 3),
              height: height,
              decoration: BoxDecoration(
                color: Color(0xFFFF4646),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = mAlign;
                mColor = selectedColor;

                fColor = normalColor;
                oColor = normalColor;
              });
            },
            child: Align(
              alignment: Alignment(-1, 0),
              child: Container(
                width: width * (1 / 3),
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Male',
                  style: TextStyle(
                    color: mColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = fAlign;
                fColor = selectedColor;

                mColor = normalColor;
                oColor = normalColor;
              });
            },
            child: Align(
              alignment: Alignment(0, 0),
              child: Container(
                width: width * (1 / 3),
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Female',
                  style: TextStyle(
                    color: fColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = oAlign;
                oColor = selectedColor;

                fColor = normalColor;
                mColor = normalColor;
              });
            },
            child: Align(
              alignment: Alignment(1, 0),
              child: Container(
                width: width * (1 / 3),
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Other',
                  style: TextStyle(
                    color: oColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
