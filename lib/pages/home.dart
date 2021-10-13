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
  Future<User> user;
  Future<Map<String, String>> teste;

  //  Future<User> getUserAsync(res) async {
  //   print(res);
  //   print(User.fromJson());
  //   return User.fromJson(res);
  // }

  void getName() async {
    teste = await FlutterSession().get("user");
    print(teste.runtimeType);
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
                  future: this.user,
                  builder: (context, snapshot) {
                    print(snapshot.data);
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
