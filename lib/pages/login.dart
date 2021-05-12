import 'package:flaevr/components/button.dart';
import 'package:flaevr/pages/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  void _login() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          child: Stack(
            children: [
              Image(
                  image: AssetImage('lib/assets/images/top_content_login.png')),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 40, right: 40, bottom: 50, top: 30),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Color.fromRGBO(61, 61, 78, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
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
