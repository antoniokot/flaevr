import 'package:flaevr/components/productCard.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/pages/favorites.dart';
import 'package:flaevr/services/FolderService.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:async';

import 'package:palette_generator/palette_generator.dart';

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

  Future<List<ProductModel>> recents;
  Future<List<Folder>> allFolders;
  User user;
  Color userColor;

  void getUser() async {
    await FlutterSession().get("user").then((json) async {
      this.user = User.fromJson(json);
      this.allFolders = FolderService.getAllFoldersByIdUser(this.user.id);
      this.recents = ProductService.getAllRecentProducts(this.user.id);
      PaletteGenerator color = await ColorGenerator.getMainColors(
          new NetworkImage(
              "https://images.pexels.com/photos/4345992/pexels-photo-4345992.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          new Size(500, 500),
          3);
      this.userColor = color.lightMutedColor.color;
      setState(() {});
    });
  }

  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor:
              this.userColor == null ? Styles.mutedGrey : this.userColor,
          body: Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 60),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_borderRadius),
                        topRight: Radius.circular(_borderRadius)),
                  ),
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
                              padding: EdgeInsets.only(left: 19),
                              child: Text(
                                "Recentes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF3D3D4E)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: SizedBox(
                                height: 220,
                                child: FutureBuilder<List<ProductModel>>(
                                  future: recents,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              ProductCard(
                                                heightAspectRatio:
                                                    new AspectRatio(
                                                        aspectRatio: 2.3),
                                                width: 140,
                                                product: snapshot.data[index],
                                              ));
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
                                                Skeleton(
                                                  width: 140,
                                                  height: 240,
                                                  padding: EdgeInsets.all(12),
                                                  radius: 16,
                                                ));
                                  },
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 19),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Favoritos",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xFF3D3D4E))),
                                      Padding(
                                        padding: EdgeInsets.only(right: 19),
                                        child: InkWell(
                                          customBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Styles.lightMutedGrey,
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 15.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    "Nova Pasta",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.add,
                                                    size: 15,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          onTap: () => {},
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            Container(
                              height: MediaQuery.of(context).size.height - 200,
                              margin: Styles.sidePadding,
                              child: FutureBuilder<List<Folder>>(
                                future: allFolders,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Favorites(
                                      built: true,
                                      folders: snapshot.data,
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text('${snapshot.error}');
                                  }
                                  // By default, show a loading skeleton.
                                  return Favorites(
                                    built: false,
                                    folders: [],
                                  );
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
                    color: this.userColor == null
                        ? Styles.mutedGrey
                        : this.userColor,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19),
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
                              Text(this.user == null ? "" : this.user.name),
                              IconButton(
                                  icon: Icon(Icons.settings), onPressed: () {})
                            ]))),
              ),
            ],
          )),
    );
  }
}
