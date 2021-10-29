import 'package:flaevr/components/button.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/pages/signup.dart';
import 'package:flaevr/pages/home.dart';
import 'package:flaevr/pages/spa.dart';
import 'package:flaevr/services/UserService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:async';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool _errorShow = false;
  final _email = TextEditingController();
  final _pass = TextEditingController();

  void _login() async {
    print("login started");
    if (_email.text.isEmpty ||
        !_email.text.contains("@") ||
        !_email.text.contains("."))
      _errorShow = true;
    else
      _errorShow = false;
    _pass.text.isEmpty ? _errorShow = true : _errorShow = false;

    if (_errorShow == true) {
      setState(() {});
      return;
    } else {
      try {
        UserService.login(_email.text, _pass.text).then((res) async {
          //print(res);
          if (res != null) {
            var session = FlutterSession();
            await session.set(
                "user",
                new User(
                    id: res.id,
                    name: res.name,
                    email: res.email,
                    avatar: res.avatar,
                    rememberMeToken: res.rememberMeToken));

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Origin()));
          } else {
            print("deu erro");
            setState(() {
              _errorShow = true;
            });
          }
        });
      } catch (e) {
        setState(() {
          _errorShow = true;
        });
        print(e);
      }
    }
  }

  void removeErrMsg() {
    if (_errorShow == true) {
      setState(() {
        _errorShow = false;
      });
      return;
    }
  }

  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    child: Image(
                        image: AssetImage(
                            'lib/assets/images/top_content_login.png')),
                    fit: BoxFit.fill,
                  )),
              Positioned(
                  top: () {
                    double size;
                    if (MediaQuery.of(context).viewInsets.bottom > 0)
                      size = MediaQuery.of(context).size.height / 12;
                    else
                      size = MediaQuery.of(context).size.height / 3;

                    return size;
                  }(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: () {
                      double size;
                      if (MediaQuery.of(context).viewInsets.bottom > 0)
                        size = MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height / 12 +
                                MediaQuery.of(context).viewInsets.bottom);
                      else
                        size = MediaQuery.of(context).size.height -
                            MediaQuery.of(context).size.height / 3;

                      return size;
                    }(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    child: ListView(
                      physics: new BouncingScrollPhysics(),
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: 40, right: 40, bottom: 50, top: 30),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Color.fromRGBO(61, 61, 78, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 26),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Email ou nome de usuário",
                                    style: TextStyle(
                                        color: Color(0xFF3d3d4e),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                                TextField(
                                  onChanged: (text) {
                                    removeErrMsg();
                                  },
                                  controller: _email,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF3d3d4e)),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          Color.fromRGBO(241, 241, 242, 1),
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(8.0),
                                        ),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                )
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(26),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Senha",
                                    style: TextStyle(
                                        color: Color(0xFF3d3d4e),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                                TextField(
                                  onSubmitted: (v) => _login,
                                  onChanged: (text) {
                                    removeErrMsg();
                                  },
                                  controller: _pass,
                                  obscureText: !_obscureText,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF3d3d4e)),
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Color(0xFFbdbdbf),
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromRGBO(241, 241, 242, 1),
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 8.0),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(8.0),
                                        ),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                ),
                                Visibility(
                                    visible: _errorShow,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                            "O e-mail ou a senha inseridos estão incorretos.",
                                            style: Styles.errText)))
                              ],
                            )),
                        Button(
                          padding: EdgeInsets.only(
                              left: 26, right: 26, bottom: 11, top: 20),
                          constraints:
                              BoxConstraints(minWidth: 100, maxWidth: 300),
                          width: double.infinity,
                          height: 42,
                          text: "Login",
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          backgroundColor: Color.fromRGBO(255, 70, 70, 1),
                          onPressed: _login,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TextButton(
                            child: Text(
                              "Não tem uma conta? Clique Aqui",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Color.fromRGBO(97, 85, 166, 1)),
                            ),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()))
                            },
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
