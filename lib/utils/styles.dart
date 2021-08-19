import 'package:flutter/material.dart';

class Styles {
  //text
  static TextStyle smallTitle = TextStyle(
      color: Color(0xFF3d3d4e), fontSize: 13, fontWeight: FontWeight.w600);
  static TextStyle noteText = TextStyle(
      color: Color(0XFFbababa), fontSize: 12, fontWeight: FontWeight.w300);

  //padding
  static EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: 19);
  static EdgeInsets sidePaddingWithVerticalSpace =
      EdgeInsets.symmetric(horizontal: 19, vertical: 10);

  //colors
  static Color ultraLightMutedGrey = Color(0xffEFF3F5);
  static Color lightMutedGrey = Color(0xffF1F1F2);
  static Color textBlack = Color(0xff3d3d4e);
}
