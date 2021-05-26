import 'package:flaevr/pages/config.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/components/button.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Button(
        padding: EdgeInsets.only(left: 40, right: 40, bottom: 11, top: 20),
        constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
        width: double.infinity,
        height: 42,
        text: "Registrar-se com o Email",
        textStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        backgroundColor: Color.fromRGBO(255, 70, 70, 1),
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Config()))
        },
      ),
    ));
  }
}
