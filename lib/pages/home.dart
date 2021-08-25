import 'package:flaevr/pages/config.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/components/button.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String nome = "Mariana";

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, 
        body: Padding(
          padding: const EdgeInsets.all(29.0),
          child: Column(
            children: <Widget>[
              Text(
                "Olá, " + nome,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF3D3D4E)),
              ),
            ],
          ),
        )
      ),
    );
  }
}
