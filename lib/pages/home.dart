import 'package:flaevr/pages/config.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/components/button.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white, body: Container()),
    );
  }
}
