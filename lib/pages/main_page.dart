import 'package:flaevr/components/button.dart';
import 'package:flaevr/components/folder.dart';
import 'package:flaevr/pages/login.dart';
import 'package:flaevr/pages/signup.dart';
import 'package:flutter/material.dart';


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _redirectRegister() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Signup()));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Expanded(
            child: Stack(
              children: [
                Image(image: AssetImage('lib/assets/images/main_page_gif.gif')),
                Positioned(
                    top: MediaQuery.of(context).size.height / 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 22),
                          constraints:
                              BoxConstraints(minWidth: 100, maxWidth: 300),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Image(
                                  image: AssetImage(
                                      'lib/assets/images/flaevr_logo_rounded.png'),
                                ),
                              ),
                              Text(
                                "Bem-vindo(a)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                    fontSize: 24,
                                    color: Color.fromRGBO(61, 61, 78, 1)),
                              )
                            ],
                          ),
                        ),
                        Button(
                          padding: EdgeInsets.only(
                              left: 40, right: 40, bottom: 11, top: 20),
                          constraints:
                              BoxConstraints(minWidth: 100, maxWidth: 300),
                          width: double.infinity,
                          height: 42,
                          text: "Registrar-se com o Email",
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          backgroundColor: Color.fromRGBO(255, 70, 70, 1),
                          onPressed: _redirectRegister,
                        ),
                        Button(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 11),
                          constraints:
                              BoxConstraints(minWidth: 100, maxWidth: 300),
                          width: double.infinity,
                          height: 42,
                          text: "Entrar com o Facebook",
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          backgroundColor: Color.fromRGBO(24, 119, 242, 1),
                          onPressed: _redirectRegister,
                        ),
                      ]),
                    ))
              ],
            ),
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
                    context, MaterialPageRoute(builder: (context) => Login()))
              },
            ),
          ),
          FavFolder()
        ]));
  }
}
