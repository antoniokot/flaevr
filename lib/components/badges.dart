import 'package:flaevr/components/badge.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> badges = ["a", "b", "c"];

    return Container(
        height: 85,
        margin: EdgeInsets.symmetric(horizontal: 19),
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: badges.map((item) => Badge()).toList().cast<Widget>(),
        ));
  }
}
