import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/services/UserService.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flaevr/utils/sessionManager.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  User? user;

  void getUser() async {
    dynamic json = await FlutterSession().get("user");
    setState(() {
      this.user = User.fromJson(json);
    });
  }

  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 19.0, vertical: 29.0),
            child: Column(
              children: <Widget>[
                Text(
                  "Olá, " + (this.user == null ? "" : this.user!.name!),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF3D3D4E)),
                ),
              ],
            ),
          )),
    );
  }
}
