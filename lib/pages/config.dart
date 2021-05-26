import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  Config({Key key}) : super(key: key);

  @override
  ConfigState createState() => ConfigState();
}

class ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    TextStyle dangerText = TextStyle(
        fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFFFF4646));
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xFF3d3d4e)),
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Configurações",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF3D3D4E)),
              ),
              Container(
                child: ListView(),
                height: 400,
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Container(
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    "Logins",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                        color: Color(0xFF3D3D4E)),
                                  )),
                              TextButton(
                                child: Text(
                                  "Sair da sessão",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xFF9E9EA2)),
                                ),
                                onPressed: () => {},
                              ),
                              TextButton(
                                child: Text(
                                  "Desativar minha conta",
                                  textAlign: TextAlign.start,
                                  style: dangerText,
                                ),
                                onPressed: () => {},
                              ),
                              TextButton(
                                child: Text(
                                  "Apagar minha conta",
                                  textAlign: TextAlign.start,
                                  style: dangerText,
                                ),
                                onPressed: () => {},
                              ),
                            ],
                          ))),
                ),
              ),
            ],
          ),
        ));
  }
}
