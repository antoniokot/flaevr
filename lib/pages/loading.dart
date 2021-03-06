import 'package:flaevr/pages/spa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flaevr/pages/main_page.dart';
import 'package:flaevr/utils/sessionManager.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<bool> checkLogin() async {
    dynamic user;
    try {
      user = await FlutterSession().get("user");
    } catch (exception) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    }
    if (user == null)
      return false;
    else
      return true;
  }

  @override
  void initState() {
    super.initState();
    checkLogin().then((res) {
      if (!res) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Origin()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 70, 70, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 37),
              child: Image(
                  image:
                      AssetImage('lib/assets/images/flaevr_logo_letters.png')),
            ),
          )),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: SpinKitRing(
                  color: Colors.white,
                  size: 50.0,
                  lineWidth: 4,
                )),
          ))
        ],
      ),
    );
  }
}
