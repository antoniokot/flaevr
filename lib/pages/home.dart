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
  Future<User> usr;

  void getName() async {
    this.usr = await FlutterSession().get("user");
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
                FutureBuilder<User>(
                  future: usr,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        "Olá, " + snapshot.data.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF3D3D4E)),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    // return Skeleton(width: 190, height: 20);
                    return Skeleton(
                      width: 140,
                      height: 22,
                    );
                  },
                )
              ],
            ),
          )),
    );
  }
}
