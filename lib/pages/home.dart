import 'package:flaevr/components/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<User> usr;

  void initState() {
    usr = fetchById();
    super.initState();
  }

  Future<User> fetchById() async {
    final id = 2;
    final response = await http
        .get(Uri.parse('http://127.0.0.1:3333/users/unique/' + id.toString()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(response.body.toString());
      List<dynamic> values = json.decode(response.body);
      Map<String, dynamic> map = values[0];
      return User.fromJson(map);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
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
                    return Skeleton(width: 190, height: 20);
                  },
                )
              ],
            ),
          )),
    );
  }
}
