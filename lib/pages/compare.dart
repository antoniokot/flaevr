import 'package:flaevr/components/compareCard.dart';
import 'package:flaevr/pages/main_page.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class Compare extends StatefulWidget {
  Compare({Key key}) : super(key: key);

  @override
  CompareState createState() => CompareState();
}

class CompareState extends State<Compare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Styles.sidePaddingWithVerticalSpace,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CompareCard(),
            CompareCard(),
          ]
        ),
      ),
    );
  }
}
