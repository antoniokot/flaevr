import 'package:flaevr/models/User.dart';
import 'package:flaevr/pages/adittionalData.dart';
import 'package:flaevr/pages/main_page.dart';
import 'package:flaevr/pages/spa.dart';
import 'package:flaevr/utils/sessionManager.dart';
import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  Config({Key? key}) : super(key: key);

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
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(Icons.person),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Minha conta"))
                                ],
                              ),
                            ),
                            SizedBox(height: 7),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(Icons.description),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Informações adicionais"))
                                ],
                              ),
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdditionalData(
                                              buildAppBar: true,
                                            )))
                              },
                            ),
                            SizedBox(height: 7),
                            GestureDetector(
                              child: Row(
                                children: [
                                  Icon(Icons.info),
                                  Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Sobre o Flaevr"))
                                ],
                              ),
                            )
                          ],
                        ),
                        height: MediaQuery.of(context).size.height / 1.5,
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      height: MediaQuery.of(context).size.height / 2.5,
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
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 30),
                                alignment: Alignment.centerLeft),
                            child: Text(
                              "Sair da sessão",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFF9E9EA2)),
                            ),
                            onPressed: () async {
                              dynamic session = new FlutterSession();

                              await session.destroy().then(Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage())));
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 30),
                                alignment: Alignment.centerLeft),
                            child: Text(
                              "Desativar minha conta",
                              textAlign: TextAlign.start,
                              style: dangerText,
                            ),
                            onPressed: () => {},
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 30),
                                alignment: Alignment.centerLeft),
                            child: Text(
                              "Apagar minha conta",
                              textAlign: TextAlign.start,
                              style: dangerText,
                            ),
                            onPressed: () => {},
                          ),
                        ],
                      )),
                ],
              )),
        ));
  }
}
