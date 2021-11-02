import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Button(
      {required this.padding,
      required this.constraints,
      required this.width,
      required this.height,
      required this.text,
      required this.onPressed,
      required this.textStyle,
      required this.backgroundColor});

  final EdgeInsets padding;
  final BoxConstraints constraints;
  final double width;
  final double height;
  final String text;
  final Function onPressed;
  final TextStyle textStyle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      constraints: constraints,
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
          child: Text(text, style: textStyle),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }
}
