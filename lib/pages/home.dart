import 'package:flaevr/components/gaugeChart.dart';
import 'package:flaevr/components/ripple.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/services/UserService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flaevr/utils/sessionManager.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  User? user;

  void getUser() async {
    dynamic json = await FlutterSession().get("user");
    setState(() {
      this.user = User.fromJson(json);
    });
  }

  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 19.0, vertical: 29.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Olá, " +
                        (this.user == null
                            ? ""
                            : this.user!.name!.split(" ")[0]) +
                        ", você já escaneou 5 itens essa semana.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color(0xFF3D3D4E)),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      child: Center(
                        child: RipplesAnimation(
                          animateChild: false,
                          size: 40,
                          color: Color(0xFFFF4646),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(75)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.23),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              width: 75,
                              height: 75,
                              child: Center(
                                  child: Text(
                                "5",
                                style: TextStyle(
                                    fontSize: 27.0,
                                    color: Styles.textBlack,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                      )),
                  Center(
                      child: Container(
                          width: 220,
                          height: 82,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 82,
                                      child: GaugeChart(
                                        50.0,
                                        color: Colors.green,
                                        animate: true,
                                        width: 0.21,
                                      ),
                                    ),
                                    Icon(Icons.spa, color: Colors.green),
                                    Positioned(
                                      bottom: 0,
                                      child: Text("Veganos",
                                          style: Styles.smallText),
                                    ),
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 82,
                                      child: GaugeChart(
                                        50.0,
                                        color: Colors.green,
                                        animate: true,
                                        width: 0.21,
                                      ),
                                    ),
                                    Icon(Icons.nature, color: Colors.green),
                                    Positioned(
                                      bottom: 0,
                                      child: Text("Veganos",
                                          style: Styles.smallText),
                                    ),
                                  ],
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 82,
                                      child: GaugeChart(
                                        50.0,
                                        color: Colors.green,
                                        animate: true,
                                        width: 0.21,
                                      ),
                                    ),
                                    Icon(Icons.nature, color: Colors.green),
                                    Positioned(
                                      bottom: 0,
                                      child: Text("Veganos",
                                          style: Styles.smallText),
                                    ),
                                  ],
                                ),
                              ]))),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              expand: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.23),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, -1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item $index'));
                    },
                  ),
                );
              },
            ),
          ])),
    );
  }
}
