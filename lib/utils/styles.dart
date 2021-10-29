import 'package:flutter/material.dart';

class Styles {
  //text
  static TextStyle smallTitle = TextStyle(
      color: Color(0xFF3d3d4e), fontSize: 13, fontWeight: FontWeight.w600);
  static TextStyle mediumTitle = TextStyle(
      color: Color(0xFF3d3d4e), fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle noteText = TextStyle(
      color: Color(0XFFbababa), fontSize: 12, fontWeight: FontWeight.w300);
  static TextStyle smallText = TextStyle(
      color: Color(0xFF3d3d4e), fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle errText = TextStyle(
      color: Color(0xFFff3d4e), fontSize: 13, fontWeight: FontWeight.w500);
  //padding
  static EdgeInsets sidePadding = EdgeInsets.symmetric(horizontal: 19);
  static EdgeInsets sidePaddingWithVerticalSpace =
      EdgeInsets.symmetric(horizontal: 19, vertical: 10);
  static EdgeInsets smallSidePaddingWithVerticalSpace =
      EdgeInsets.symmetric(horizontal: 15, vertical: 10);

  //colors
  static Color ultraLightMutedGrey = Color(0xffEFF3F5);
  static Color lightMutedGrey = Color(0xffE1E1E2);
  static Color mutedGrey = Color(0xffA6A6A7);
  static Color textBlack = Color(0xff3d3d4e);
}
