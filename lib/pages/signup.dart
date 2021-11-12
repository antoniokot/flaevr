import 'dart:convert';

import 'package:flaevr/models/User.dart';
import 'package:flaevr/pages/adittionalData.dart';
import 'package:flaevr/pages/home.dart';
import 'package:flaevr/pages/login.dart';
import 'package:flaevr/pages/spa.dart';
import 'package:flaevr/services/AdditionalInformationService.dart';
import 'package:flaevr/services/UserService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/components/button.dart';
import 'package:flaevr/utils/sessionManager.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {
  bool _nameErr = false;
  bool _emailErr = false;
  bool _passErr = false;
  bool _confPassErr = false;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confPass = TextEditingController();

  void _register() {
    print("\x1B[33msignup.dart: Sign up was started...\x1B[0m");

    _nameErr = false;
    _emailErr = false;
    _passErr = false;
    _confPassErr = false;

    if (_name.text.isEmpty || _name.text.length > 30) 
      _nameErr = true;
    if (_email.text.isEmpty || !_email.text.contains("@") || !_email.text.contains(".")) 
      _emailErr = true;
    if (_pass.text.isEmpty || _pass.text.length < 8 || !_pass.text.contains(new RegExp(r'[0-9]'))) 
      _passErr = true;
    if (_confPass.text.isEmpty || _pass.text != _confPass.text)
      _confPassErr = true;

    setState(() {});
    if (_nameErr || _emailErr || _passErr || _confPassErr) {
      return;
    } else {
      UserService.postNewUser(
        context,
        new User(
          id: 1,
          name: _name.text,
          email: _email.text,
          password: _pass.text,
          rememberMeToken: "",
          avatar: ""
        )
      ).then((res) async {
        if (res != null) {
          var session = FlutterSession();
          await session.set(
            "user",
            new User(
              id: res.id,
              name: res.name, 
              email: res.email,
              avatar: res.avatar,
              password: "",
              rememberMeToken: res.rememberMeToken
            )
          );

          List<String> searches = [];
          await session.set(
            "searches",
            jsonEncode(searches)
          );

          print("\x1B[33msignup.dart: Sign up completed with success!.\x1B[0m");
          Navigator.push(
<<<<<<< HEAD
              context,
              // MaterialPageRoute(
              //     builder: (context) => AdditionalData(
              //         buildAppBar: false,
              //         onSubmmit: () => {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => Origin()))
              //             }))
              MaterialPageRoute(builder: (context) => Origin()));
=======
            context,
            MaterialPageRoute(
              builder: (context) => AdditionalData(
                buildAppBar: false,
                onSubmmit: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Origin()))
                }
              )
            )
          );
>>>>>>> 85200b220d77433adf36a2bea8fd7252a1ca3fc3
        } else
          print("\x1B[33msignup.dart: There was an error whilst signing up.\x1B[0m");
      });
    }
  }

  bool _obscureText = true;
  bool _obscureConfText = true;

  @override
  void initState() {
    _obscureText = false;
    _obscureConfText = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color(0xFF3d3d4e)),
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
                            'lib/assets/images/top_register_img.png')),
                    fit: BoxFit.fill,
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height / 9,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).viewInsets.bottom +
                            MediaQuery.of(context).size.height / 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    child: ListView(
                      physics: new BouncingScrollPhysics(),
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 50, top: 20),
                          child: Center(
                            child: Text(
                              "Cadastro",
                              style: TextStyle(
                                  color: Color.fromRGBO(61, 61, 78, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
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
                                    "Nome",
                                    style: TextStyle(
                                        color: Color(0xFF3d3d4e),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                                TextField(
                                  controller: _name,
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
                                ),
                                Visibility(
                                    visible: _nameErr,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                            "O nome deve ter no mínimo 1 e no máximo 30 caracteres.",
                                            style: Styles.errText)))
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
                                    "Email",
                                    style: TextStyle(
                                        color: Color(0xFF3d3d4e),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                                TextField(
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
                                ),
                                Visibility(
                                    visible: _emailErr,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text("O e-mail é inválido.",
                                            style: Styles.errText)))
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 26),
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
                                    visible: _passErr,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                            "A senha deve ter no mínimo 8 caracteres e 1 número.",
                                            style: Styles.errText)))
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
                                    "Confirmar senha",
                                    style: TextStyle(
                                        color: Color(0xFF3d3d4e),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                                TextField(
                                  controller: _confPass,
                                  obscureText: !_obscureConfText,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF3d3d4e)),
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureConfText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Color(0xFFbdbdbf),
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _obscureConfText =
                                                !_obscureConfText;
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
                                    visible: _confPassErr,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text("A senha deve ser a mesma.",
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
                          text: "Cadastrar",
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          backgroundColor: Color.fromRGBO(255, 70, 70, 1),
                          onPressed: _register,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TextButton(
                            child: Text(
                              "Já tem uma conta? Clique Aqui",
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
                                      builder: (context) => Login()))
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
