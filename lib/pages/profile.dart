import 'package:flaevr/components/productCard.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool isVisible = true;
  bool isOpaque = true;
  double _borderRadius = 20.0;
  _onUpdateScroll(ScrollMetrics metrics) {
    if (metrics.pixels > -1 && metrics.pixels < 20) {
      setState(() {
        _borderRadius = 20 - metrics.pixels;
      });
    }
  }

  Future<User> fetchById() async {
    final response = await http.get(Uri.parse('/users/unique/2'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }
  }
  Future<List<ProductModel>> recents;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 60),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(_borderRadius),
                          topRight: Radius.circular(_borderRadius))),
                  child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification) {
                          _onUpdateScroll(scrollNotification.metrics);
                        }
                        return false;
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text("Recentes",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff3d3d4e),
                                      fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(
                              height: 220,
                              child: FutureBuilder<List<ProductModel>>(
                                    future: recents,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: recents.length,
                                          itemBuilder:
                                          (BuildContext context, int index) =>
                                            ProductCard(
                                              heightAspectRatio:
                                                new AspectRatio(aspectRatio: 2.3),
                                              width: 140,
                                            )
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }
                                      // By default, show a loading skeleton.
                                      return ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 15,
                                          itemBuilder:
                                          (BuildContext context, int index) =>
                                            Skeleton(width: 140, height 240);
                                        );
                                    },
                                  ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Favoritos",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff3d3d4e),
                                              fontWeight: FontWeight.w500)),
                                      Row(
                                        children: [
                                          Text(
                                            'Data de Modificação',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          Icon(Icons.expand_more)
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 200,
                              child: FutureBuilder<ProductModel>(
                                    future: recents,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Favorites(built: true);
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }
                                      // By default, show a loading skeleton.
                                      return Favorites(built: false);
                                    },
                                  ),
                            ),
                          ],
                        ),
                      ))),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: size.width,
                    color: Colors.blue,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.pexels.com/photos/4345992/pexels-photo-4345992.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Text('Mariana Melo'),
                              IconButton(
                                  icon: Icon(Icons.settings), onPressed: () {})
                            ]))),
              ),
            ],
          )),
    );
  }
}
