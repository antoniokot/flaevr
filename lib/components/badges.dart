import 'package:flaevr/components/badge.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> badges = ["a", "b", "c"];

    return Wrap(
      children: badges.map((item) => Badge()).toList().cast<Widget>(),
    );
  }
}
