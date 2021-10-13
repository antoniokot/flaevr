import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/services/UserService.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_session/flutter_session.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  User user;

  void getName() async {
    //this.user = User.fromJson(await FlutterSession().get("user")) as Future<User>; talvez funcione precisa testar
    dynamic json = await FlutterSession().get("user");
    this.user = User.fromJson(json);
  }

  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 19.0, vertical: 29.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Olá, " + this.user.name == null ? "" : this.user.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF3D3D4E)),
                )
              ],
            ),
          )),
    );
  }
}
